
import UIKit

class NuevoCursoViewController: UIViewController {

    @IBOutlet weak var txtNombreCurso: UITextField!
    @IBOutlet weak var txtPracticaCurso: UITextField!
    @IBOutlet weak var txtLaboratorioCurso: UITextField!
    @IBOutlet weak var txtExamenCurso: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func agregarCurso(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let curso = Curso(context: context)
        curso.nombre = txtNombreCurso.text!
        curso.promedioPrac = Double(txtPracticaCurso.text!)!
        curso.promedioLab = Double(txtLaboratorioCurso.text!)!
        curso.examenFin = Double(txtExamenCurso.text!)!
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)

    }
}
