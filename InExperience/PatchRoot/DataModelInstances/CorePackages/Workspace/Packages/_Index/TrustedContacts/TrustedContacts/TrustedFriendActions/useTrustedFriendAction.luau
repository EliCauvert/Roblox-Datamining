local trustedContacts = script:FindFirstAncestor("TrustedContacts")
local reactModule = require(trustedContacts.Parent.React)
local getTFActionModule = require(trustedContacts.Requests.getTFAction)
local _ = require(script.Parent.TFActionsEnum)
local fFlagTFPassQRCodeSourceModule = require(trustedContacts.Flags.FFlagTFPassQRCodeSource)

return function(value)
	-- upvalues: fFlagTFPassQRCodeSourceModule (ref), reactModule (ref), getTFActionModule (ref)
	local userId = value.userId
	local tokens = value.tokens
	local var1 = if fFlagTFPassQRCodeSourceModule then value.sentFromQrCode else nil
	local var2, var3 = reactModule.useState({ isLoading = true, enum = nil })
	reactModule.useEffect(function()
		-- upvalues: getTFActionModule (copy), userId (ref), tokens (ref), fFlagTFPassQRCodeSourceModule (copy), var1 (ref), var3 (ref)
		getTFActionModule(userId, {
			friendRequestToken = tokens,
			sentFromQrCode = if fFlagTFPassQRCodeSourceModule then var1 else nil
		}):andThen(function(p1)
			-- upvalues: var3 (copy)
			var3({ isLoading = false, enum = p1 })
		end):catch(function(_)
			-- upvalues: var3 (copy)
			var3({ isLoading = false, enum = nil })
		end)
	end, {
		userId,
		tokens,
		if fFlagTFPassQRCodeSourceModule then var1 else nil
	})
	
	return var2
end