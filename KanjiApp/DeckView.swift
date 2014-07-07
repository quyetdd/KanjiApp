import Foundation
import UIKit
import CoreData

class DeckView: CustomUIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet var tableView: UITableView
    var items: NSNumber[] = []
    
    init(coder aDecoder: NSCoder!)
    {
        super.init(coder: aDecoder)
        
        items = []
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    
        if let allCards = fetchCardsGeneral(CoreDataEntities.Card, CardProperties.index, self.managedObjectContext)
        {
            items = allCards.map { ($0 as Card).index }
        }
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return self.items.count;
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        var card = fetchCardByIndex(self.items[indexPath.row], self.managedObjectContext)
        
        cell.textLabel.text = "\(card.kanji) \(card.interval)"
        
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!)
    {
        println("You selected cell #\(indexPath.row)!")
    }
}