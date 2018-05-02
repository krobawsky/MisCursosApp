
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var cursos:[Curso] = []
    
    var indexSeleccionado = 0
    
    override func viewDidLoad() {
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.white
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.red
    }
    
    override func viewWillAppear(_ animated: Bool) {
        obtenerCursos()
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cursos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cel = UITableViewCell()
        let curso = cursos[indexPath.row]
        cel.textLabel?.text = curso.nombre!
        
        let prom = (curso.promedioPrac)*0.3 + (curso.promedioLab)*0.7 + (curso.examenFin)*0.1
        if(prom >= 13){
            cel.contentView.backgroundColor = UIColor.green
        }
        return cel
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexSeleccionado = indexPath.row
        let curso = cursos[indexPath.row]
        performSegue(withIdentifier: "cursoSeleccionadaSegue", sender: curso)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            cursos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

            context.delete(cursos[indexPath.row])
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
        }
    }
    
    @IBAction func agregarTarea(_ sender: Any) {
        performSegue(withIdentifier: "agregarSegue", sender: nil)
    }
    
    func obtenerCursos(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            cursos = try context.fetch(Curso.fetchRequest()) as! [Curso]
        } catch {
            print("HA OCURRIDO UN ERROR")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if segue.identifier == "cursoSeleccionadaSegue"{
            let siguienteVC = segue.destination as! DetalleCursoViewController
            siguienteVC.curso = sender as? Curso
        }
    }
    
}

