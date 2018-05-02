
import UIKit

class DetalleCursoViewController: UIViewController {

    @IBOutlet weak var txtPromedioPrac: UILabel!
    @IBOutlet weak var txtPromedioLab: UILabel!
    @IBOutlet weak var txtExamenFin: UILabel!
    @IBOutlet weak var txtPromedioFin: UILabel!
    
    var curso : Curso? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = curso?.nombre
        txtPromedioPrac.text = "\(curso!.promedioPrac)"
        txtPromedioLab.text = "\(curso!.promedioLab)"
        txtExamenFin.text = "\(curso!.examenFin)"
        
        let prom = (curso!.promedioPrac)*0.3 + (curso!.promedioLab)*0.7 + (curso!.examenFin)*0.1
        txtPromedioFin.text = "\(prom)"
        
        if(prom < 13){
            txtPromedioFin.textColor = UIColor.red
        }
        
    }

    
}
