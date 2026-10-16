local TrustedContacts = script:FindFirstAncestor("TrustedContacts")
local ReactModule = require(TrustedContacts.Parent.React)
local GetTFActionModule = require(TrustedContacts.Requests.getTFAction)
local _ = require(script.Parent.TFActionsEnum)
local FFlagTFPassQRCodeSourceModule = require(TrustedContacts.Flags.FFlagTFPassQRCodeSource)

return function(p1) --[[ Line: 23 | Named "useTrustedFriendAction" ]]
	-- upvalues: FFlagTFPassQRCodeSourceModule (copy), ReactModule (copy), GetTFActionModule (copy)
	local UserId = p1.userId
	local Tokens = p1.tokens
	local SentFromQrCode = if FFlagTFPassQRCodeSourceModule then p1.sentFromQrCode else nil
	local UseStateResult, UseStateResult2 = ReactModule.useState({ isLoading = true, enum = nil })
	ReactModule.useEffect(function() --[[ Line: 33 ]]
		-- upvalues: GetTFActionModule (upval), UserId (copy), Tokens (copy), FFlagTFPassQRCodeSourceModule (upval), SentFromQrCode (copy), UseStateResult2 (copy)
		GetTFActionModule(UserId, {
			friendRequestToken = Tokens,
			sentFromQrCode = if FFlagTFPassQRCodeSourceModule then SentFromQrCode else nil
		}):andThen(function(Result) --[[ Line: 38 ]]
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2({ isLoading = false, enum = Result })
		end):catch(function(_) --[[ Line: 44 ]]
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