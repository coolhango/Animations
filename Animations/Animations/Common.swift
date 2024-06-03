// Last Updated: 2 June 2024, 3:42PM.
// Copyright © 2024 Gedeon Koh All rights reserved.
// No part of this publication may be reproduced, distributed, or transmitted in any form or by any means, including photocopying, recording, or other electronic or mechanical methods, without the prior written permission of the publisher, except in the case of brief quotations embodied in reviews and certain other non-commercial uses permitted by copyright law.
// THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHOR OR COPYRIGHT HOLDER BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
// Use of this program for pranks or any malicious activities is strictly prohibited. Any unauthorized use or dissemination of the results produced by this program is unethical and may result in legal consequences.
// This code have been tested throughly. Please inform the operator or author if there is any mistake or error in the code.
// Any damage, disciplinary actions or death from this material is not the publisher's or owner's fault.
// Run and use this program this AT YOUR OWN RISK.
// Version 0.1

// This Space is for you to experiment your codes
// Start Typing Below :) ↓↓↓

import Foundation
import UIKit

let screenRect = UIScreen.main.bounds
let generalFrame = CGRect(x: 0, y: 0, width: screenRect.width / 2.0, height: screenRect.height / 4.0)
let generalCenter = CGPoint(x: screenRect.midX, y: screenRect.midY - 50)

func drawRectView(_ color: UIColor, frame: CGRect, center: CGPoint) -> UIView {
  let view = UIView(frame: frame)
  view.center = center
  view.backgroundColor = color
  return view
}

func drawCircleView() -> UIView {
  let circlePath = UIBezierPath(arcCenter: CGPoint(x: 100,y: screenRect.midY - 50), radius: CGFloat(20), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
  
  let shapeLayer = CAShapeLayer()
  shapeLayer.path = circlePath.cgPath
  
  shapeLayer.fillColor = UIColor.red.cgColor
  shapeLayer.strokeColor = UIColor.red.cgColor
  shapeLayer.lineWidth = 3.0
  
  let view = UIView()
  view.layer.addSublayer(shapeLayer)
  
  return view
}

func makeAlert(_ title: String, message: String, actionTitle: String) -> UIAlertController {
  let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
  alert.addAction(UIAlertAction(title: actionTitle, style: UIAlertAction.Style.default, handler: nil))
  
  return alert
}
