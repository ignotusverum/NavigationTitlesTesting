import SwiftUI
import UIKit

class ViewController: UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        let button = UIButton(type: .system)
        button.addTarget(self,
                         action: #selector(buttonTapped),
                         for: .touchUpInside)
        button.setTitle("Push SwiftUI View", for: .normal)
        
        let button2 = UIButton(type: .system)
        button2.addTarget(self,
                         action: #selector(button2Tapped),
                         for: .touchUpInside)
        button2.setTitle("Push UIViewController", for: .normal)

        let stackView = UIStackView(arrangedSubviews: [button, button2])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(equalToConstant: 120),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        self.view = view
    }
    
    @objc func buttonTapped() {
        let hostingController = UIHostingController(rootView: SwiftUIView())
        navigationController?.pushViewController(hostingController,
                                                 animated: true)
    }
    
    @objc func button2Tapped() {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .white
        viewController.title = "UIViewController"
        navigationController?.pushViewController(viewController,
                                                 animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Navigation Test"
        navigationItem.backButtonTitle = "Back"
    }
}

struct SwiftUIView: View {
  var body: some View {
    EmptyView()
          .navigationTitle("SwiftUI View")
  }
}
