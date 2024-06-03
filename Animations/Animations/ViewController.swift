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

import UIKit

let headerHeight = 50.0
let segueDetailIdentifier = "toAnimateDetail"
let duration = 1.5

class ViewController: UIViewController {
  // MARK: - IBOutlets
  @IBOutlet weak var masterTableView: UITableView!
  
  // MARK: - Variables
  fileprivate let items = ["2-Color", "Simple 2D Rotation", "Multicolor", "Multi Point Position", "BezierCurve Position",
                       "Color and Frame Change", "View Fade In", "Pop"]
  
  
  // MARK: - Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    animateTable()
  }
  
  func animateTable() {
    masterTableView.reloadData()
    
    let cells = masterTableView.visibleCells
    let tableHeight = masterTableView.bounds.size.height
    
    // move all cells to the bottom of the screen
    for cell in cells {
      cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
    }
    
    // move all cells from bottom to the right place
    var index = 0
    for cell in cells {
      UIView.animate(withDuration: duration, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
        cell.transform = CGAffineTransform(translationX: 0, y: 0)
        }, completion: nil)
      index += 1
    }
  }
  
  // MARK: - Segue
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == segueDetailIdentifier {
      let detailView = segue.destination as! DetailViewController
      let indexPath = masterTableView.indexPathForSelectedRow
      
      if let indexPath = indexPath {
        detailView.barTitle = self.items[(indexPath as NSIndexPath).row]
      }
    }
  }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return CGFloat(headerHeight)
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "Basic Animations"
  }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellIdentifier = "cell"
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
    
    cell.textLabel?.text = self.items[(indexPath as NSIndexPath).row]
    
    return cell
  }
}

