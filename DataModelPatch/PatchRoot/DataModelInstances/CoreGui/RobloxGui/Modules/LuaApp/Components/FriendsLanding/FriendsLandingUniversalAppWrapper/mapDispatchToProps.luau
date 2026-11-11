local Modules = script:FindFirstAncestor("Modules")
local NavigateDownToFriendRequestsModule = require(Modules.LuaApp.Thunks.NavigateDownToFriendRequests)
local OpenProfilePeekViewModule = require(Modules.LuaApp.Thunks.OpenProfilePeekView)
local NavigateToUserInfoModule = require(Modules.LuaApp.Thunks.NavigateToUserInfo)
local OpenContactImporterLearnMoreLinkModule = require(Modules.LuaApp.Thunks.OpenContactImporterLearnMoreLink)
local OpenCentralOverlayForPlayerContextualMenuModule = require(Modules.LuaApp.Thunks.OpenCentralOverlayForPlayerContextualMenu)
local NavigateDownTo3DQRCodePageModule = require(Modules.LuaApp.Thunks.NavigateDownTo3DQRCodePage)
local OpenAmpWizardContainerFunction = require(game:GetService("CorePackages").Workspace.Packages.AmpUpsell).OpenAmpWizardContainer

return function(Callback)
	-- upvalues: NavigateDownToFriendRequestsModule (copy), OpenProfilePeekViewModule (copy), OpenCentralOverlayForPlayerContextualMenuModule (copy), NavigateToUserInfoModule (copy), OpenContactImporterLearnMoreLinkModule (copy), NavigateDownTo3DQRCodePageModule (copy), OpenAmpWizardContainerFunction (copy)
	return {
		navigateDownToFriendRequests = function()
			-- upvalues: Callback (copy), NavigateDownToFriendRequestsModule (upval)
			Callback(NavigateDownToFriendRequestsModule())
		end,
		openProfilePeekView = function(p1, p2)
			-- upvalues: Callback (copy), OpenProfilePeekViewModule (upval)
			assert(type(p1) == "string", "Expected userId to be a string")
			Callback(OpenProfilePeekViewModule(p1, p2))
		end,
		openPlayerContextualMenu = function(p1)
			-- upvalues: Callback (copy), OpenCentralOverlayForPlayerContextualMenuModule (upval)
			Callback(OpenCentralOverlayForPlayerContextualMenuModule(p1))
		end,
		navigateToUserInfo = function(p1, p2)
			-- upvalues: Callback (copy), NavigateToUserInfoModule (upval)
			assert(type(p1) == "string", "Expected userId to be a string")
			Callback(NavigateToUserInfoModule(p1, p2))
		end,
		openLearnMoreLink = function()
			-- upvalues: Callback (copy), OpenContactImporterLearnMoreLinkModule (upval)
			Callback(OpenContactImporterLearnMoreLinkModule())
		end,
		navigateTo3DQRCodePage = function(p1)
			-- upvalues: Callback (copy), NavigateDownTo3DQRCodePageModule (upval)
			Callback(NavigateDownTo3DQRCodePageModule(p1))
		end,
		openAmpWizardContainer = function(p1, p2)
			-- upvalues: Callback (copy), OpenAmpWizardContainerFunction (upval)
			Callback(OpenAmpWizardContainerFunction(p1, p2))
		end
	}
end