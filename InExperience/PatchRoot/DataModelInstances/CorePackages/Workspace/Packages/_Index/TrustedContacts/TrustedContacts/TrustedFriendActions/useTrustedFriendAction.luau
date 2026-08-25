local trustedContacts = script:FindFirstAncestor("TrustedContacts")
local reactModule = require(trustedContacts.Parent.React)
local getTFActionModule = require(trustedContacts.Requests.getTFAction)
local _ = require(script.Parent.TFActionsEnum)
local fFlagTFPassQRCodeSourceModule = require(trustedContacts.Flags.FFlagTFPassQRCodeSource)

return function(value)
	-- upvalues: fFlagTFPassQRCodeSourceModule (ref), reactModule (ref), getTFActionModule (ref)
	local userId = value.userId
	local tokens = value.tokens
	local var4 = if fFlagTFPassQRCodeSourceModule then value.sentFromQrCode else nil
	local var5, var6 = reactModule.useState({ isLoading = true, enum = nil })
	reactModule.useEffect(function()
		-- upvalues: getTFActionModule (copy), userId (ref), tokens (ref), fFlagTFPassQRCodeSourceModule (copy), var4 (ref), var6 (ref)
		getTFActionModule(userId, {
			friendRequestToken = tokens,
			sentFromQrCode = if fFlagTFPassQRCodeSourceModule then var4 else nil
		}):andThen(function(p0)
			-- upvalues: var6 (copy)
			var6({ isLoading = false, enum = p0 })
		end):catch(function(_)
			-- upvalues: var6 (copy)
			var6({ isLoading = false, enum = nil })
		end)
	end, {
		userId,
		tokens,
		if fFlagTFPassQRCodeSourceModule then var4 else nil
	})
	
	return var5
end