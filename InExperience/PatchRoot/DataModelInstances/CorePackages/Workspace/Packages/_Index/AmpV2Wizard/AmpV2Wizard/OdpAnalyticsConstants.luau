return {
	NEED_TO_REVERIFY_NODE = "NeedToReverify",
	PROLOGUE_NODE = "Prologue",
	AGE_GROUP_KEY = "ageGroup",
	ASK_COPY_VARIANT_KEY = "askCopyVariant",
	PARENT_SUPERVISION_STATE_KEY = "parentSupervisionState",
	INTRO_COPY_VARIANT_KEY = "copyVariant",
	DEFAULT_INTRO_COPY_VARIANT = "default",
	PIN_PURPOSE_KEY = "pinPurpose",
	REVERIFY_REASON_KEY = "reverifyReason",
	Contexts = {
		Handoff = "odpHandoff",
		Intro = "odpIntro",
		VerifyMethod = "odpVerifyMethod",
		PinEntry = "odpPinEntry",
		PinRecovery = "odpPinRecovery",
		GameJoin = "gameJoinContentMaturityLock",
		Settings = "parentalEntrySettings"
	},
	Fields = {
		VerifyMethod = "verifyMethod",
		VerificationFailed = "verificationFailed",
		PinEntry = "pinEntry",
		PinShowToggle = "pinShowToggle",
		PinIncorrect = "pinIncorrect",
		AskParent = "askParent",
		RequestSentToast = "requestSentToast"
	},
	Buttons = {
		ContinueAsParent = "continueAsParent",
		Continue = "continue",
		Back = "back",
		AskInPerson = "askInPerson",
		AskParent = "askParent",
		CancelAskParent = "cancelAskParent",
		EmailParent = "emailParent",
		Cancel = "cancel",
		Privacy = "privacy",
		Terms = "terms",
		ForgotPin = "forgotPin",
		Close = "close"
	},
	AssociatedText = {
		AgreementScreen = "Parent mode - Your child is asking for parental approval. Let's get you set up. / Millions of kids play Roblox every day / Safety is built in",
		AgreementContinue = "Continue",
		AgreementBack = "< back chevron",
		AgreementTerms = "Terms of Use",
		AgreementPrivacy = "Privacy Policy",
		VerificationMethodSelector = "Identity verification - Choose a verification method",
		VerificationMethodOptions = "Facial age estimation / Credit card / Government ID",
		VerificationMethodContinue = "Continue",
		VerificationMethodBack = "< back chevron",
		VerificationFailed = "Verification failed - Try again later",
		PinEntryShown = "Enter your PIN - Enter your PIN to approve your child's request. Forgot PIN",
		PinEntry = "6-digit code",
		PinShowToggle = "Show",
		PinHideToggle = "Hide",
		ForgotPin = "Forgot PIN",
		PinRecoveryClose = "X icon",
		AskParent = "Ask your parent",
		AskInPerson = "Ask in person / Continue on this device",
		EmailParent = "Send an email / Continue on parent's device",
		Cancel = "X icon",
		RequestSent = "Request sent"
	},
	PinRevealStates = { Shown = "shown", Hidden = "hidden" },
	ReverifyVariants = {
		PinAttemptsExhausted = {
			field = "tooManyFailedAttempts",
			associatedText = "Too many failed attempts - To reset the PIN, a parent or guardian will need to verify their identity.",
			buttons = {
				Continue = { btn = "reset", associatedText = "Continue" },
				Cancel = { btn = "cancelReset", associatedText = "Cancel" }
			}
		},
		ForgotPin = {
			field = "verificationRequired",
			associatedText = "Verification required - To reset the PIN, you need to verify you are the parent or guardian.",
			buttons = {
				Continue = {
					btn = "continueVerification",
					associatedText = "Continue"
				},
				Cancel = { btn = "cancelVerification", associatedText = "Cancel" }
			}
		}
	}
}