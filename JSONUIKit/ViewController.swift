//
//  ViewController.swift
//  JSONUIKit
//
//  Created by Jorge Maldonado Borbón on 03/02/21.
//

import UIKit

class celda: UITableViewCell {
    
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var email: UILabel!
    
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var tabla: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabla.delegate = self
        tabla.dataSource = self
        ModeloViewModel.shared.fetch{ done in
            if done {
                self.tabla.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ModeloViewModel.shared.datosModelo.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabla.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! celda
        let user = ModeloViewModel.shared.datosModelo.data[indexPath.row]
        cell.nombre.text = user.first_name
        cell.email.text = user.email
        guard let imageURL = URL(string: user.avatar) else { fatalError("sin imagen") }
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                cell.imagen.image = image
                self.tabla.reloadData()
            }
        }
        return cell
    }

    

}

