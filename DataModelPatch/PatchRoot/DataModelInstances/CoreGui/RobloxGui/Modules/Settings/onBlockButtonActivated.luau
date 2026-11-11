local ContextActionService = game:GetService("ContextActionService")
local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local RoactModule = require(CorePackages.Packages.Roact)
local PromiseModule = require(CorePackages.Packages.Promise)
local CoreScriptsRootProvider = require(CorePackages.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider
local BlockingAnalyticsModule = require(script.Parent.Analytics.BlockingAnalytics)
local BlockingModalScreenModule = require(script.Parent.Components.Blocking.BlockingModalScreen)
local FFlagAddNewPlayerListMobileFocusNav = require(CorePackages.Workspace.Packages.PlayerList).Flags.FFlagAddNewPlayerListMobileFocusNav
local BlockingContainer = nil

local function _()
	-- upvalues: BlockingContainer (ref), RoactModule (copy), ContextActionService (copy)
	if BlockingContainer ~= nil then
		RoactModule.unmount(BlockingContainer)
		BlockingContainer = nil
		ContextActionService:UnbindCoreAction("BlockingModalScreen")
	end
end

return function(Player: Player, p1, Source, p2)
	-- upvalues: PromiseModule (copy), BlockingAnalyticsModule (copy), BlockingContainer (ref), RoactModule (copy), ContextActionService (copy), FFlagAddNewPlayerListMobileFocusNav (copy), GuiService (copy), BlockingModalScreenModule (copy), CoreScriptsRootProvider (copy), RobloxGui (copy)
	return PromiseModule.new(function(Callback)
		-- upvalues: p1 (copy), BlockingAnalyticsModule (upval), Player (copy), Source (copy), BlockingContainer (upval), RoactModule (upval), ContextActionService (upval), FFlagAddNewPlayerListMobileFocusNav (upval), p2 (copy), GuiService (upval), BlockingModalScreenModule (upval), CoreScriptsRootProvider (upval), RobloxGui (upval)
		local P1 = p1 or BlockingAnalyticsModule.new()
		P1:action("SettingsHub", "blockUserButtonClick", { blockeeUserId = Player.UserId, source = Source })
		
		if BlockingContainer ~= nil then
			RoactModule.unmount(BlockingContainer)
			BlockingContainer = nil
			ContextActionService:UnbindCoreAction("BlockingModalScreen")
		end
		local function CloseModal()
			-- upvalues: BlockingContainer (upval), RoactModule (upval), ContextActionService (upval), Callback (copy), FFlagAddNewPlayerListMobileFocusNav (upval), p2 (upval), GuiService (upval)
			if BlockingContainer ~= nil then
				RoactModule.unmount(BlockingContainer)
				BlockingContainer = nil
				ContextActionService:UnbindCoreAction("BlockingModalScreen")
			end
			Callback()
			
			if FFlagAddNewPlayerListMobileFocusNav then
				if p2 and p2.onBlockingModalClose then
					p2.onBlockingModalClose()
					
					return
				end
			elseif FFlagAddNewPlayerListMobileFocusNav then
				GuiService.SelectedCoreObject = nil
			end
		end
		
		BlockingContainer = RoactModule.mount(RoactModule.createElement(CoreScriptsRootProvider, {}, {
			BlockingModalScreen = RoactModule.createElement(BlockingModalScreenModule, {
				player = Player,
				closeModal = CloseModal,
				analytics = P1,
				source = Source,
				onBlockingSuccess = p2 and p2.onBlockingSuccess or nil
			})
		}), RobloxGui, "BlockingContainer")
		ContextActionService:BindCoreAction("BlockingModalScreen", CloseModal, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape)
	end)
end