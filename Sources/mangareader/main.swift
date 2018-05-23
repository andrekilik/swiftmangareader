import Kanna
import Alamofire
import Foundation
print("Hello, world!")

class MangaScrapper {
    
    var mangaList = [Int: Any]()
    var mangaLink = [String: String]()
    
    func getDataAlamo() {
        Alamofire.request("http://mangareader.net/alphabetical").responseString {
            response in
            print("\(String(describing: response.result.value))")
            if let html = response.result.value {
                self.parseHTML(html: html)
            }
        }
    }
    
    func parseHTML(html: String)  {
        do {
            let doc = try Kanna.HTML(html: html, encoding: String.Encoding.utf8)
            for manga in doc.xpath("//*[@id=\"wrapper_body\"]/div/div/div/ul/li/a") {
                print(manga.text!)
            }
        } catch let error {
            print(error)
        }
//        if let doc = try Kanna.HTML(html: html, encoding: String.Encoding.utf8) {
//            let mangaArray = doc.xpath("//*[@id=\"wrapper_body\"]/div/div/div/ul/li/a")
//            var index = 0
//            while index <= mangaArray.count - 1 {
//                mangaLink[mangaArray[index].text!] = mangaArray[index].toHTML!
//                mangaList[index] = mangaLink
//                //                print(mangaArray[index].text!)
//                //                print(mangaArray[index].toHTML!)
//                //                print(index)
//                index += 1
//            }
//            //            print(mangaLink)
//            print(mangaList.count)
//
//
//            //            for manga in doc.xpath("//*[@id=\"wrapper_body\"]/div/div/div/ul/li/a") {
//            //                print(manga.text!)
//            //                print(manga.toHTML!)
//            //            }
//        }
    }
}

var mangaScrapper = MangaScrapper()
mangaScrapper.getDataAlamo()
