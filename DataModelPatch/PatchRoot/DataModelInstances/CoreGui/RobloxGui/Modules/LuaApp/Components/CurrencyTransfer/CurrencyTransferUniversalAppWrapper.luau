local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local CurrencyTransfersModule = require(CorePackages.Workspace.Packages.CurrencyTransfers)
local UseNavigationPropsFunction = require(CorePackages.Workspace.Packages.RobloxAppNavigation).useNavigationProps
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local TransferRobuxFlow = CurrencyTransfersModule.TransferRobuxFlow
local TransferDirection = CurrencyTransfersModule.Enums.TransferDirection

return function(_)
	-- upvalues: UseNavigationFunction (copy), UseNavigationPropsFunction (copy), TransferDirection (copy), ReactModule (copy), TransferRobuxFlow (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseNavigationPropsResult = UseNavigationPropsFunction(function(_, p1)
		return {
			direction = p1.direction,
			recipientUserId = p1.recipientUserId,
			transferId = p1.transferId,
			transferOrigination = p1.transferOrigination
		}
	end)
	local Direction: string = UseNavigationPropsResult.direction
	local RecipientUserId = UseNavigationPropsResult.recipientUserId
	
	return ReactModule.createElement(TransferRobuxFlow, {
		direction = if Direction and string.lower(Direction) == "receive" then TransferDirection.Receive else TransferDirection.Send,
		recipientUserId = if type(RecipientUserId) == "string" then tonumber(RecipientUserId) else RecipientUserId,
		transferId = UseNavigationPropsResult.transferId,
		transferOrigination = UseNavigationPropsResult.transferOrigination,
		onClose = function()
			-- upvalues: UseNavigationResult (copy)
			UseNavigationResult.pop()
		end
	})
end