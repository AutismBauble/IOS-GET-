import UIKit

class ViewController: UIViewController {

    @IBOutlet var tvout: UITextView!
    @IBAction func Connectbtnpress(sender: AnyObject) {


        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: configuration, delegate:nil, delegateQueue:NSOperationQueue())//创建一个新的线程

        let request = NSURLRequest(URL: NSURL(string: "http://localhost:63342/untitled/learn.php?name=\(tvinput.text!)")!)//传入地址，参数为 tvinput.text的内容

        let task = session.dataTaskWithRequest(request, completionHandler: { (data:NSData?, response:NSURLResponse?, error:NSError?) -> Void in

            if let _ = data{
                //把消息发给主线程
                dispatch_sync(dispatch_get_main_queue(), { () -> Void in

                self.tvout.text = (NSString(data: data!, encoding: NSUTF8StringEncoding)) as String!

                })

            }

        })

        task.resume()

    }
    @IBOutlet var tvinput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
