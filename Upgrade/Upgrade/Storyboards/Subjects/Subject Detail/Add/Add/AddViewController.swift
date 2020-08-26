import UIKit
import Firebase

class AddViewController: UIViewController, UITextFieldDelegate {

    // MARK: - Outlets
    @IBOutlet var viewMain: UIView!
    @IBOutlet var viewGrade: UIView!
    @IBOutlet var buttonLevel: UIButton!
    @IBOutlet var fieldMaxScore: UITextField!
    @IBOutlet var fieldUserScore: UITextField!
    @IBOutlet var labelOutputGrade: UILabel!
    @IBOutlet var labelOutputScore: UILabel!

    // MARK: - Properties
    var level = String()
    var subject = String()
    var currentTextField = UITextField()
    var grade = String()
    var score = Double()
    var reference: DocumentReference!

    // MARK: - Overrides
    /// Overrides preferred status bar style (color) from black (default) to white.
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        /// Prints out to command line for better debugging purposes.
        print("upgradeconsoleREDIRECT: Redirection to AddViewController executed.")

        /// Calls extension function configureView() (see UIView+Design.swift) to configure background gradient color for SettingsViewController.
        self.view.configureView(color1: "UP Purple", color2: "UP Blue")

        /// Configures viewMain to have a cornerRadius of 20; some corners are then masked to retain the original rectangle shape.
        viewMain.layer.cornerRadius = 20
        viewMain.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

        /// Assigns the delegates to the textFields to manage keyboard first responders.
        fieldMaxScore.delegate = self
        fieldUserScore.delegate = self

        /// Calls extension function configureTextField() (see UITextField+Design.swift) to configure the overall design for the textFields.
        fieldMaxScore.configureTextField()
        fieldUserScore.configureTextField()

        /// Calls extension function configureButton() (see UIButton+Design.swift) to configure the overall design for buttonToggle.
        buttonLevel.configureButton(color1: "UP Purple", color2: "UP Blue")

        /// Calls extension function viewShadow() (see UIView+Design.swift) to place a shadow on viewGrade.
        viewGrade.viewShadow()
        viewGrade.layer.cornerRadius = 10

    }

    // MARK: - Functions
    // This function is a protocol for UITextFieldDelegate; it is executed when the textField is being interacted with and highlighted.
    /// Retrieves the current, highlighted textField (that is being interacted with) and brings it to the front in viewCredentials.
    func textFieldDidBeginEditing(_ textField: UITextField) {
        currentTextField = textField
        viewMain.bringSubviewToFront(currentTextField)
    }

    // This function is a protocol for UITextFieldDelegate; it is executed when the return key of the keyboard is pressed.
    /// Evaluates the current active text field.
    /* If the current textField is fieldEmail, the keyboard will be resigned and the focus is switched over to fieldPassword.
     Else, if the current textField is fieldPassword, the keyboard will be resigned.
     */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case fieldMaxScore:
            fieldMaxScore.resignFirstResponder()
            fieldUserScore.becomeFirstResponder()
        default:
            fieldUserScore.resignFirstResponder()
        }
        return true
    }

    // This function is a protocol for UITextField Delegate; it is executed when the textField is done editing and proceeds to the next textField.
    /// Evaluates the text in the fields.
    /* If the text is not empty (""), then the shadow is removed, prompting to the user design-wise that their input is no longer needed.
     Else, if the text is empty, the opacity will be restored back to the default value (0.2), prompting to the user design-wise that their input is required.
     */
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        if currentTextField.text != "" {
            UIView.animate(withDuration: 1) {
                self.currentTextField.layer.shadowOpacity = 0
            }
        } else {
            UIView.animate(withDuration: 1) {
                self.currentTextField.layer.shadowOpacity = 0.2
            }
        }
    }

    func checkGrades(maxScore: Double, userScore: Double) {
        self.score = (userScore / maxScore) * 100

        if self.score < 40 {
            grade = "F9"
            labelOutputGrade.text = grade

            let formatter = NumberFormatter()
            formatter.maximumFractionDigits = 2
            let roundedScore = formatter.string(from: NSNumber(value: score))!

            labelOutputScore.text = "\(String(roundedScore))%"
        } else if self.score >= 40 && self.score < 45 {
            grade = "E8"
            labelOutputGrade.text = grade

            let formatter = NumberFormatter()
            formatter.maximumFractionDigits = 2
            let roundedScore = formatter.string(from: NSNumber(value: score))!

            labelOutputScore.text = "\(String(roundedScore))%"
        } else if self.score >= 45 && self.score < 50 {
            grade = "D7"
            labelOutputGrade.text = grade

            let formatter = NumberFormatter()
            formatter.maximumFractionDigits = 2
            let roundedScore = formatter.string(from: NSNumber(value: score))!

            labelOutputScore.text = "\(String(roundedScore))%"
        } else if self.score >= 50 && self.score < 55 {
            grade = "C6"
            labelOutputGrade.text = grade

            let formatter = NumberFormatter()
            formatter.maximumFractionDigits = 2
            let roundedScore = formatter.string(from: NSNumber(value: score))!

            labelOutputScore.text = "\(String(roundedScore))%"
        } else if self.score >= 55 && self.score < 60 {
            grade = "C5"
            labelOutputGrade.text = grade

            let formatter = NumberFormatter()
            formatter.maximumFractionDigits = 2
            let roundedScore = formatter.string(from: NSNumber(value: score))!

            labelOutputScore.text = "\(String(roundedScore))%"
        } else if self.score >= 60 && self.score < 65 {
            grade = "B4"
            labelOutputGrade.text = grade

            let formatter = NumberFormatter()
            formatter.maximumFractionDigits = 2
            let roundedScore = formatter.string(from: NSNumber(value: score))!

            labelOutputScore.text = "\(String(roundedScore))%"
        } else if self.score >= 65 && self.score < 70 {
            grade = "B3"
            labelOutputGrade.text = grade

            let formatter = NumberFormatter()
            formatter.maximumFractionDigits = 2
            let roundedScore = formatter.string(from: NSNumber(value: score))!

            labelOutputScore.text = "\(String(roundedScore))%"
        } else if self.score >= 70 && self.score < 75 {
            grade = "A2"
            labelOutputGrade.text = grade

            let formatter = NumberFormatter()
            formatter.maximumFractionDigits = 2
            let roundedScore = formatter.string(from: NSNumber(value: score))!

            labelOutputScore.text = "\(String(roundedScore))%"
        } else if self.score >= 75 && self.score <= 100 {
            grade = "A1"
            labelOutputGrade.text = grade

            let formatter = NumberFormatter()
            formatter.maximumFractionDigits = 2
            let roundedScore = formatter.string(from: NSNumber(value: score))!

            labelOutputScore.text = "\(String(roundedScore))%"
        } else {
            let questionAlert = UIAlertController(title: "Huh?", message: "Your input wasn't correct somewhere. Please check it again.", preferredStyle: .alert)
            questionAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
                self.fieldMaxScore.text = ""
                self.fieldUserScore.text = ""
                self.labelOutputGrade.text = "Z0"
                self.labelOutputScore.text = "0"
            }))
            present(questionAlert, animated: true)

            labelOutputGrade.text = "??"
            labelOutputScore.text = "??"
        }
    }

    // MARK: - Actions
    @IBAction func tapDismiss(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)

        guard let maxScore = fieldMaxScore.text else { return }
        guard let userScore = fieldUserScore.text else { return }

        if maxScore != "" && userScore != "" {
            checkGrades(maxScore: Double(maxScore)!, userScore: Double(userScore)!)
        }
    }

    @IBAction func buttonLevel(_ sender: UIButton) {
        guard var text = buttonLevel.currentTitle else { return }

        switch text {
        case "CA1":
            level = "SA1"
            text = "SA1"
            buttonLevel.setTitle(text, for: .normal)
        case "SA1":
            level = "CA2"
            text = "CA2"
            buttonLevel.setTitle(text, for: .normal)
        case "CA2":
            level = "SA2"
            text = "SA2"
            buttonLevel.setTitle(text, for: .normal)
        case "SA2":
            level = "PT1"
            text = "PT1"
            buttonLevel.setTitle(text, for: .normal)
        case "PT1":
            level = "PT2"
            text = "PT2"
            buttonLevel.setTitle(text, for: .normal)
        case "PT2":
            level = "CA1"
            text = "CA1"
            buttonLevel.setTitle(text, for: .normal)
        default:
            break
        }
    }

    @IBAction func buttonAdd(_ sender: UIButton) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        reference = Firestore.firestore().document("users/\(uid)/subjects/\(subject)")

        guard let maxScore = fieldMaxScore.text else { return }
        guard let userScore = fieldUserScore.text else { return }

        if maxScore != "" && userScore != "" {
            let calculatedPercentage = (Double(userScore)! / Double(maxScore)!) * 100.0
            let data: [String: Any] = ["\(level)Score": calculatedPercentage]

            let confirmAlert = UIAlertController(title: "Confirm adding?", message: "This score will show up in other places throughout the app.", preferredStyle: .alert)
            confirmAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
                self.reference.updateData(data)
                self.dismiss(animated: true, completion: nil)
            }))
            confirmAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
            }))
            present(confirmAlert, animated: true)
        } else {
            let errorAlert = UIAlertController(title: "Something went wrong.", message: "Some fields are left blank.", preferredStyle: .alert)
            errorAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            }))
            present(errorAlert, animated: true)
        }
    }

    @IBAction func buttonCancel(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
