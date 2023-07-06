//
//  ViewController.swift
//  ModalViewTest
//
//  Created by 노민우 on 2023/07/06.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setConstrains()
    }


    lazy var presentButton: UIButton = {
       let button = UIButton()
        button.setTitle("Present", for: .normal)
        button.backgroundColor = .systemPink
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(buttonHandler), for: .touchUpInside)
        return button
    }()
    
    @objc func buttonHandler(_ sendrer: UIButton){
        showModalVC()
    }
    
    func setConstrains() {
        view.addSubview(presentButton)
        setPresenButtonConstraints()
    }
    
    // presentButton의 오토레이아웃 함수
    func setPresenButtonConstraints() {
        presentButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            presentButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30),
            presentButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            presentButton.widthAnchor.constraint(equalToConstant: 120),
            presentButton.heightAnchor.constraint(equalToConstant: 60),
            
        ])
    }
    
    func showModalVC() {
        let vc = ModalViewController()
        
        // 내가 만든 ModalViewController의 View를 sheetPresentationController 를 적용시키기위함.
        if let sheet = vc.sheetPresentationController {
            sheet.delegate = self
            // detents 멈춤쇠 ,sheet의 높이를 멈추는 높이를 정해줄수있다.
            sheet.detents = [.medium(), .large()]
            
            // 시트 상단에 그래버를 표시할지 여부를 결정하는 부울 값입니다.
            sheet.prefersGrabberVisible = true
            // 스크롤이 시트를 더 큰 멈춤쇠로 확장할지 여부를 결정하는 부울 값입니다.
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            
//            print(sheet.selectedDetentIdentifier) 기본값 Nil, 가장 최근에 선택한 large(), .medium() 를 나타내줌
            
            // 시트 아래의 시야를 어둡게 하지 않는 가장 큰 멈춤쇠.
            sheet.largestUndimmedDetentIdentifier = .large
        }
        
        self.present(vc, animated: true)
    }
}

extension ViewController: UISheetPresentationControllerDelegate {
    func sheetPresentationControllerDidChangeSelectedDetentIdentifier(_ sheetPresentationController: UISheetPresentationController) {
        self.view.alpha = 0.9
    }
}

import SwiftUI

#if DEBUG
extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController
        
        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        }
    }
    
    func toPreview() -> some View {
        Preview(viewController: self)
    }
}
#endif


// MARK: - PreView 읽기
import SwiftUI

#if DEBUG
struct PreView: PreviewProvider {
    static var previews: some View {
        // 사용할 뷰 컨트롤러를 넣어주세요
        ViewController()
            .toPreview()
    }
}
#endif


