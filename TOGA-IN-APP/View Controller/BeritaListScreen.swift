//
//  BeritaListScreen.swift
//  TOGA-IN-APP
//
//  Created by Mirza Fachreza 2 on 27/04/19.
//  Copyright © 2019 Pramahadi Tama Putra. All rights reserved.
//

import UIKit


class BeritaListScreen: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    var sections: [String] = ["Berita Populer","Berita Terbaru"]
    var judulBerita: [String] = ["Berita1","Berita2","Berita3"]
    var gambarBerita: [String] = ["DummyGede","DummyGede","DummyGede"]
    var beritas: [Berita] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.topItem?.title = "Berita"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        
        beritas = createArray()

    }
    
    func createArray() -> [Berita]{

        var tempBerita: [Berita] = []

        let berita1 = Berita(image: #imageLiteral(resourceName: "artikelUtama"), title: "BPOM melakukan razia terhadap beberapa Rumah Sakit di Jakarta - Tribunnews")
        let berita2 = Berita(image: #imageLiteral(resourceName: "DummyGede"), title: "Tanaman ini dapat menekan keinginan anda untuk merokok - KASKUS.id")
        let berita3 = Berita(image: #imageLiteral(resourceName: "DummyGede"), title: "Tanaman Obat Keluarga dapat membantu persalinan - Kompas.com")
        let berita4 = Berita(image: #imageLiteral(resourceName: "DummyGede"), title: "BPOM melakukan razia terhadap beberapa Rumah Sakit di Jakarta - Tribunnews")
        let berita5 = Berita(image: #imageLiteral(resourceName: "DummyGede"), title: "BPOM melakukan razia terhadap beberapa Rumah Sakit di Jakarta - Tribunnews")

        tempBerita.append(berita1)
        tempBerita.append(berita2)
        tempBerita.append(berita3)
        tempBerita.append(berita4)
        tempBerita.append(berita5)

        return tempBerita
    }
    
}

extension BeritaListScreen: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section]
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }
//       return 4
        
//        return judulBerita.count
        return beritas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let berita = beritas[indexPath.row]
//        let berita = judulBerita[indexPath.row]
//        let gberita = gambarBerita[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "BeritaCell") as! BeritaCell
        
        
//        cell.beritaJudul.text = "\(berita)"
//        cell.beritaGambar.image = UIImage(named: "\(gberita)")
        
        cell.beritaGambar.image = berita.image
        cell.beritaJudul.text = berita.title
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = storyboard?.instantiateViewController(withIdentifier: "Jahe") as! PassingDataViewController
        
        viewController.name = "BERITA"
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
