//view must has this delegates:
UIImagePickerControllerDelegate, UINavigationControllerDelegate


//class need to have iiipc instance
var uiipc = UIImagePickerController()


//in viewDidLoad()
uiipc.delegate = self

//example of addPhoto button and delegates
    @IBAction func addPhotoButton(sender: UIButton) {
        uiipc.sourceType = UIImagePickerControllerSourceType.Camera
        self.presentViewController(uiipc, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        self.photoFromCamera = image
        self.dismissViewControllerAnimated(true, completion: nil)
        self.imageViewField.image = self.photoFromCamera
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
