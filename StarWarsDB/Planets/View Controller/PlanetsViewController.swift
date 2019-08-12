import UIKit

class PlanetsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @objc func screenEdgeSwipedLeft(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        if recognizer.state == .recognized {
            tabBarController?.selectedIndex = 0
        }
    }

    private func configureGestures() {
        let edgePanLeft = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screenEdgeSwipedLeft))
        edgePanLeft.edges = .left
        view.addGestureRecognizer(edgePanLeft)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
