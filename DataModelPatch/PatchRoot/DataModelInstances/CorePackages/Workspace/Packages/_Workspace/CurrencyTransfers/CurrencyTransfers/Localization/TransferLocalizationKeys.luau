return {
	Presets = {
		TransferRobuxErrorSheet = {
			SendRobux = "Features.Transfers.RobuxTransfer.Heading.SendRobux",
			GenericError = "Features.Transfers.Body.GenericSentError",
			DailyLimitExceeded = "Features.Transfers.Body.DailyLimitExceededError",
			MonthlyLimitExceeded = "Features.Transfers.Body.MonthlyLimitExceededError",
			AccountDisabled = "Features.Transfers.Body.UnableSendRobuxError",
			ReceiverNotAllowed = "Features.Transfers.RobuxTransfer.Error.ReceiverNotAllowed",
			ReceiveLimitExceeded = "Features.Transfers.Body.ReceiverLimitHitError",
			TransferAmountBelowMinimum = "Features.Transfers.Body.TransferAmountBelowMinimumError",
			TransferAmountExceedsMaximum = "Features.Transfers.Body.TransferAmountExceedsMaximumError",
			TryAgain = "Features.Transfers.RobuxTransfer.Action.TryAgain",
			OK = "Features.Transfers.Action.Ok"
		},
		TransferRobuxConfirmSheet = {
			SendRobux = "Features.Transfers.RobuxTransfer.Heading.SendRobux",
			NewConnection = "Features.Transfers.RobuxTransfer.Label.NewConnection",
			JoinedInYear = "Features.Transfers.RobuxTransfer.Label.JoinedInYear",
			ConnectedYear = "Features.Transfers.Label.ConnectedSince",
			ConnectedMonths = "Features.Transfers.Label.ConnectedMonths",
			ConnectedMonthsSingular = "Features.Transfers.Label.ConnectedMonthsSingular",
			ConnectedDays = "Features.Transfers.Label.ConnectedDays",
			ConnectedDaysSingular = "Features.Transfers.Label.ConnectedDaysSingular",
			MutualConnection = "Features.Transfers.RobuxTransfer.Label.MutualConnection",
			MutualConnectionSingular = "Features.Transfers.RobuxTransfer.Label.MutualConnectionSingular",
			AgeEstimationDisclaimer = "Features.Transfers.RobuxTransfer.Disclaimer.AgeEstimationTransfer",
			Send = "Features.Transfers.RobuxTransfer.Action.Send",
			Edit = "Features.Transfers.RobuxTransfer.Action.Edit",
			RecipientWillGet = "Features.Transfers.RobuxTransfer.Label.RecipientWillGet",
			RecipientWillGetInGame = "Features.Transfers.RobuxTransfer.Label.RecipientWillGetInGame",
			RecipientWillGetInApp = "Features.Transfers.RobuxTransfer.Label.RecipientWillGetInApp"
		},
		TransferRobuxInputSheet = {
			SendRobux = "Features.Transfers.RobuxTransfer.Heading.SendRobux",
			Next = "Features.Transfers.RobuxTransfer.Action.Next",
			Disclaimer = "Features.Transfers.RobuxTransfer.SentInstantNoFee",
			LowerThanMinAmount = "Features.Transfers.Error.LowerThanMinAmount",
			GreaterThanMaxAmount = "Features.Transfers.Error.GreaterThanMaxAmount"
		},
		InsufficientBalanceSheet = {
			SendRobux = "Features.Transfers.RobuxTransfer.Heading.SendRobux",
			InsufficientBalance = "Features.Transfers.Error.InsufficientBalance",
			BuyRobux = "Features.Transfers.Action.BuyRobux"
		},
		TransferRobuxSuccessToast = {
			SuccessNotification = "Features.Transfers.RobuxTransfers.Label.SuccessNotification"
		},
		TransferRobuxSuccessModal = {
			SendRobux = "Features.Transfers.RobuxTransfer.Heading.SendRobux",
			SuccessNotification = "Features.Transfers.RobuxTransfers.Label.SuccessNotification",
			OK = "Features.Transfers.Action.Ok"
		},
		ReceiveRobuxSuccessToast = {
			SuccessNotification = "Features.Transfers.Transfers.Label.ReceivedNotification",
			AlreadyAcceptedNotification = "Features.Transfers.Notification.ReceiveSuccess"
		},
		ReceiveErrorSheet = {
			GenericError = "Features.Transfers.Body.GenericReceiveError",
			AccountDisabled = "Features.Transfers.Body.UnableReceiveRobuxError",
			TransferExpired = "Features.Transfers.Body.ExpiredTransferError",
			TryAgain = "Features.Transfers.RobuxTransfer.Action.TryAgain",
			OK = "Features.Transfers.Action.Ok"
		},
		TransferFAEBlockSheet = {
			RequireSenderFAE = "Features.Transfers.Transfer.Block.RequireSenderFAE",
			RequireReceiverFAE = "Features.Transfers.Transfer.Block.RequireReceiverFAE",
			RequireFAE = "Features.Transfers.Transfer.Body.RequireFAE",
			Continue = "Features.Transfers.Action.Continue"
		},
		VPCBlockContainer = {
			AskParentTitle = "Features.Transfers.Action.VPC.AskParentTitle",
			AskParentBodyReceive = "Features.Transfers.Action.VPC.AskParentBodyReceive",
			AskParentBodySend = "Features.Transfers.Action.VPC.AskParentBodySend",
			Ask = "Features.Transfers.Action.VPC.Ask"
		},
		SubscriptionUpsellContainer = {
			UpsellSubscriptionTitle = "Features.Transfers.Title.UpsellSubscription"
		}
	}
}