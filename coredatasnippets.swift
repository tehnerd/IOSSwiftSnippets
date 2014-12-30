//create lazy context in view
    lazy var managedObjectContext: NSManagedObjectContext? = {
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        if let managedObjectContext = appDelegate.managedObjectContext {
            return managedObjectContext
        }
        else {
            return nil
        }
    }()


//add data etc (on simple schema LogItem with title and itemText
import Foundation
import CoreData

class LogItem: NSManagedObject {

    @NSManaged var title: String
    @NSManaged var itemText: String
    
    class func createInManagementObjectContext(moc: NSManagedObjectContext, title: String, itemText: String) -> LogItem{
        let newItem = NSEntityDescription.insertNewObjectForEntityForName("LogItem", inManagedObjectContext: moc) as LogItem
        newItem.title = title
        newItem.itemText = itemText
        return newItem
    }
    
    class func insertNewItem(moc: NSManagedObjectContext, title: String) -> LogItem{
        let fetchRequest = NSFetchRequest(entityName: "LogItem")
        fetchRequest.predicate = NSPredicate(format: "title == %@", title)
        let fetchResults = moc.executeFetchRequest(fetchRequest, error: nil) as? [LogItem]
        if fetchResults!.count != 0 {
            println("exist")
            return fetchResults![0]
        } else {
            let item = createInManagementObjectContext(moc, title: title, itemText: "")
            return item
        }
    }

}
