local TrustedContacts = script:FindFirstAncestor("TrustedContacts")
local ReactModule = require(TrustedContacts.Parent.React)
local GetTFActionModule = require(TrustedContacts.Requests.getTFAction)
local _ = require(script.Parent.TFActionsEnum)
local FFlagTFPassQRCodeSourceModule = require(TrustedContacts.Flags.FFlagTFPassQRCodeSource)

return function(p1)
	-- upvalues: FFlagTFPassQRCodeSourceModule (copy), ReactModule (copy), GetTFActionModule (copy)
	local UserId = p1.userId
	local Tokens = p1.tokens
	local SentFromQrCode = if FFlagTFPassQRCodeSourceModule then p1.sentFromQrCode else nil
	local UseStateResult, UseStateResult2 = ReactModule.useState({ isLoading = true, enum = nil })
	ReactModule.useEffect(function()
		-- upvalues: GetTFActionModule (upval), UserId (copy), Tokens (copy), FFlagTFPassQRCodeSourceModule (upval), SentFromQrCode (copy), UseStateResult2 (copy)
		GetTFActionModule(UserId, {
			friendRequestToken = Tokens,
			sentFromQrCode = if FFlagTFPassQRCodeSourceModule then SentFromQrCode else nil
		}):andThen(function(Result)
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2({ isLoading = false, enum = Result })
		end):catch(function(_)
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2({ isLoading = false, enum = nil })
		end)
	end, {
		UserId,
		Tokens,
		if FFlagTFPassQRCodeSourceModule then SentFromQrCode else nil
	})
	
	return UseStateResult
end