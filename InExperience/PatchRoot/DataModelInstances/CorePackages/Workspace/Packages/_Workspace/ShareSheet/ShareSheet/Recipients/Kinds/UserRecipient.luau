local Parent = script:FindFirstAncestor("ShareSheet").Parent
local ReactModule = require(Parent.React)
local _ = require(script.Parent.RecipientKind)
local UserProfileModule = require(Parent.DataHydration.UserProfile)
local UseExternalChatUserEligibilityModule = require(Parent.AppChat.useExternalChatUserEligibility)

return {
	create = function(UserId)
		return { kind = "user", id = `user:{UserId}`, userId = UserId }
	end,
	kind = {
		useEligibility = function(p1)
			-- upvalues: UseExternalChatUserEligibilityModule (copy), ReactModule (copy)
			local UseExternalChatUserEligibilityModuleResult = UseExternalChatUserEligibilityModule({ isActive = p1.isActive and #p1.recipients > 0 })
			
			return ReactModule.useMemo(function()
				-- upvalues: UseExternalChatUserEligibilityModuleResult (copy)
				return {
					isLoading = UseExternalChatUserEligibilityModuleResult.isLoading,
					isEligible = function()
						-- upvalues: UseExternalChatUserEligibilityModuleResult (upval)
						return UseExternalChatUserEligibilityModuleResult.isEligible
					end
				}
			end, { UseExternalChatUserEligibilityModuleResult })
		end,
		canSend = function(p1, p2)
			return p1.canSendToUser(p2.userId)
		end,
		send = function(p1, p2, p3)
			return p1.sendToUser(p2.userId, p3)
		end,
		getName = function(p1, p2)
			-- upvalues: UserProfileModule (copy)
			local InfoResult = UserProfileModule.getAndFetchUserInfo(p1.userId).info(p2)
			
			return if InfoResult then InfoResult.displayName else ""
		end,
		getParticipantIds = function(p1)
			return { p1.userId }
		end
	}
}