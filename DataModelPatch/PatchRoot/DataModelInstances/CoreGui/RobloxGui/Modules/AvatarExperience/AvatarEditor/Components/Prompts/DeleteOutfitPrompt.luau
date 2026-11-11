local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local TModule = require(CorePackages.Packages.t)
local PromiseModule = require(CorePackages.Packages.Promise)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local MemoizeFunction = require(CorePackages.Workspace.Packages.AppCommonLib).memoize
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local Focusable = RoactGamepadModule.Focusable
local WithOverlayFocusHandlingModule = require(Modules.AvatarExperience.Common.Components.withOverlayFocusHandling)
local WithMappedNavigationParamsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)
local AnalyticsModule = require(Modules.AvatarExperience.AvatarEditor.Services.Analytics)
local DeleteOutfitModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.DeleteOutfit)
local ItemsBulletListModule = require(Modules.AvatarExperience.AvatarEditor.Components.AssetManagement.ItemsBulletList)
local ToastRoduxModule = require(CorePackages.Workspace.Packages.ToastRodux)
local SetCurrentToastMessageFunction = ToastRoduxModule.Actions.SetCurrentToastMessage
local ToastType = ToastRoduxModule.Enums.ToastType
local SlotBasedEditorAnalytics = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).Surfaces.SlotBasedEditorAnalytics
local FFlagAXAddManageOutfitClickTracking = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXAddManageOutfitClickTracking
local FFlagAXCharacterToAvatarStrings = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXCharacterToAvatarStrings
local FFlagAXUpdateSlotBasedEditorToastAndPrompts = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXUpdateSlotBasedEditorToastAndPrompts
local FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation
local FFlagAXFixDeselectOutfitInManage = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXFixDeselectOutfitInManage
local config = {
	toastMessage = "Feature.Avatar.Message.AvatarDeleted",
	isLocalized = false,
	toastType = ToastType.SuccessConfirmation
}
local config1 = {
	toastMessage = "Feature.Avatar.Message.MultiAvatarDeleted",
	isLocalized = false,
	ToastType = ToastType.SuccessConfirmation
}
local DeleteOutfitPrompt = RoactModule.PureComponent:extend("DeleteOutfitPrompt")
DeleteOutfitPrompt.validateProps = TModule.strictInterface({
	outfitIds = TModule.array(TModule.string),
	onOverlayClosed = TModule.optional(TModule.callback),
	defaultChildRef = TModule.optional(TModule.table),
	focusController = TModule.optional(TModule.table),
	avatarEditorAnalytics = TModule.table,
	navigation = TModule.table,
	outfitInfos = TModule.table,
	screenSize = TModule.Vector2,
	deleteOutfit = TModule.callback,
	setCurrentToastMessage = if FFlagAXUpdateSlotBasedEditorToastAndPrompts then TModule.optional(TModule.callback) else nil
})
local MemoizeResult = MemoizeFunction(function(List, p1)
	local List1 = {}
	
	for _, value in List do
		if p1[value] then
			table.insert(List1, p1[value].name)
		end
	end
	return List1
end)

function DeleteOutfitPrompt.init(p2)
	-- upvalues: RoactModule (copy), NavigationUtilsModule (copy), FFlagAXAddManageOutfitClickTracking (copy), SlotBasedEditorAnalytics (copy), PromiseModule (copy), FFlagAXUpdateSlotBasedEditorToastAndPrompts (copy), config1 (copy), config (copy), MemoizeResult (copy), ItemsBulletListModule (copy)
	p2.mounted = false
	p2:setState({
		maxContentSize = 10000,
		itemListScrollable = false,
		isDeleting = false
	})
	p2.middleContentRef = RoactModule.createRef()
	
	function p2.closePrompt()
		-- upvalues: NavigationUtilsModule (upval), p2 (copy)
		NavigationUtilsModule.closeOverlay(p2.props.navigation)
	end
	
	function p2.deleteOutfits()
		-- upvalues: p2 (copy), FFlagAXAddManageOutfitClickTracking (upval), SlotBasedEditorAnalytics (upval), PromiseModule (upval), FFlagAXUpdateSlotBasedEditorToastAndPrompts (upval), config1 (upval), config (upval)
		local DeleteOutfitResults = {}
		
		for i, outfitId in p2.props.outfitIds do
			DeleteOutfitResults[i] = p2.props.deleteOutfit(outfitId)
		end
		p2:setState({ isDeleting = true })
		
		if FFlagAXAddManageOutfitClickTracking then
			SlotBasedEditorAnalytics.trackDeleteAvatarConfirm()
		end
		PromiseModule.all(DeleteOutfitResults):andThen(function()
			-- upvalues: FFlagAXUpdateSlotBasedEditorToastAndPrompts (upval), p2 (upval), config1 (upval), config (upval)
			if FFlagAXUpdateSlotBasedEditorToastAndPrompts then
				if #p2.props.outfitIds > 1 then
					p2.props.setCurrentToastMessage(config1)
				else
					p2.props.setCurrentToastMessage(config)
				end
			end
			if p2.mounted then
				p2.closePrompt()
			end
		end):catch(function(_)
			-- upvalues: p2 (upval)
			p2:setState({ isDeleting = false })
		end)
	end
	
	function p2.itemListScrollableUpdated(ItemListScrollable)
		-- upvalues: p2 (copy)
		if p2.state.itemListScrollable ~= ItemListScrollable then
			p2:setState({ itemListScrollable = ItemListScrollable })
		end
	end
	
	function p2.renderAlertMiddleContent()
		-- upvalues: MemoizeResult (upval), p2 (copy), RoactModule (upval), ItemsBulletListModule (upval)
		return RoactModule.createElement(ItemsBulletListModule, {
			items = MemoizeResult(p2.props.outfitIds, p2.props.outfitInfos),
			maxHeight = p2.state.maxContentSize,
			onScrollableUpdated = p2.itemListScrollableUpdated,
			[RoactModule.Ref] = p2.middleContentRef
		})
	end
	
	function p2.onAbsoluteSizeChanged(Frame)
		-- upvalues: p2 (copy)
		local Value = p2.middleContentRef:getValue()
		
		if not Value then return end
		local YDelta = p2.props.screenSize.Y - 60 - (Frame.AbsoluteSize.Y - Value.AbsoluteSize.Y)
		
		if p2.state.maxContentSize ~= YDelta then
			p2:setState({ maxContentSize = YDelta })
		end
	end
end

function DeleteOutfitPrompt.renderLocalized(p3, p4)
	-- upvalues: FFlagAXCharacterToAvatarStrings (copy), ButtonType (copy), RoactModule (copy), FFlagAXFixDeselectOutfitInManage (copy), Focusable (copy), FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation (copy), RoactGamepadModule (copy), InteractiveAlert (copy)
	local DeleteSingleCharacter = p4.deleteSingleCharacter
	local SingleNoLongerAvailable = p4.singleNoLongerAvailable
	local RenderAlertMiddleContent = nil
	local ItemListScrollable = nil
	local OnAbsoluteSizeChanged = nil
	
	if #p3.props.outfitIds > 1 then
		DeleteSingleCharacter = p4.deleteAssets
		SingleNoLongerAvailable = p4.multiNoLongerAvailable
		RenderAlertMiddleContent = if FFlagAXCharacterToAvatarStrings then nil else p3.renderAlertMiddleContent
		ItemListScrollable = p3.state.itemListScrollable
		OnAbsoluteSizeChanged = p3.onAbsoluteSizeChanged
	end
	return RoactModule.createElement(if FFlagAXFixDeselectOutfitInManage then Focusable.TextButton else Focusable.Frame, {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		AutoButtonColor = not FFlagAXFixDeselectOutfitInManage and nil,
		Text = if FFlagAXFixDeselectOutfitInManage then "" else nil,
		Selectable = not FFlagAXFixDeselectOutfitInManage and nil,
		[RoactModule.Event.Activated] = if FFlagAXFixDeselectOutfitInManage then p3.closePrompt else nil,
		[RoactModule.Ref] = p3.props.focusNavigationRef,
		inputBindings = if FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then nil else {
			NavigateBack = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonB, p3.closePrompt),
			Confirm = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, function() end, { key = "CommonUI.Controls.Action.Confirm" })
		}
	}, {
		Alert = RoactModule.createElement(InteractiveAlert, {
			title = DeleteSingleCharacter,
			bodyText = SingleNoLongerAvailable,
			buttonStackInfo = {
				buttons = {
					{
						isDefaultChild = true,
						props = { onActivated = p3.closePrompt, text = p4.cancelButtonText }
					},
					{
						buttonType = if FFlagAXCharacterToAvatarStrings then ButtonType.PrimaryContextual else ButtonType.PrimarySystem,
						props = {
							isLoading = p3.state.isDeleting,
							onActivated = p3.deleteOutfits,
							text = p4.confirmButtonText
						}
					}
				}
			},
			position = UDim2.fromScale(0.5, 0.5),
			screenSize = p3.props.screenSize,
			defaultChildRef = p3.props.defaultChildRef,
			middleContent = RenderAlertMiddleContent,
			isMiddleContentFocusable = ItemListScrollable,
			onAbsoluteSizeChanged = OnAbsoluteSizeChanged
		})
	})
end

function DeleteOutfitPrompt.render(p3)
	-- upvalues: FFlagAXCharacterToAvatarStrings (copy), WithLocalizationFunction (copy)
	local CountOutfitIds = if FFlagAXCharacterToAvatarStrings then if p3.props.outfitIds then #p3.props.outfitIds else 0 else nil
	
	return WithLocalizationFunction({
		confirmButtonText = "Feature.Avatar.Action.Delete",
		cancelButtonText = "Feature.Avatar.Action.Cancel",
		deleteSingleCharacter = if FFlagAXCharacterToAvatarStrings then "Feature.Avatar.Label.Title.DeleteSingleAvatar" else "Feature.Avatar.Heading.DeleteCharacter",
		singleNoLongerAvailable = if FFlagAXCharacterToAvatarStrings then "Feature.Avatar.Label.Message.DeleteAvatars" else "Feature.Avatar.Label.NoLongerAvailableInCollection",
		deleteAssets = if FFlagAXCharacterToAvatarStrings then {
			"Feature.Avatar.Label.Title.DeleteMultipleAvatars",
			count = CountOutfitIds
		} else "Feature.Avatar.Heading.DeleteAssets",
		multiNoLongerAvailable = if FFlagAXCharacterToAvatarStrings then "Feature.Avatar.Label.Message.DeleteAvatars" else "Feature.Avatar.Label.MultiNoLongerAvailableInCollection"
	})(function(p4)
		-- upvalues: p3 (copy)
		return p3:renderLocalized(p4)
	end)
end

function DeleteOutfitPrompt.didMount(p3)
	p3.mounted = true
end

function DeleteOutfitPrompt.willUnmount(p3)
	p3.mounted = false
end

return (WithMappedNavigationParamsModule((WithOverlayFocusHandlingModule((RoactServices.connect({ avatarEditorAnalytics = AnalyticsModule })((RoactRoduxModule.connect(function(p3, _)
	return {
		outfitInfos = p3.AvatarExperience.AvatarEditor.OutfitInfos,
		screenSize = p3.ScreenSize
	}
end, function(Callback)
	-- upvalues: DeleteOutfitModule (copy), FFlagAXUpdateSlotBasedEditorToastAndPrompts (copy), SetCurrentToastMessageFunction (copy)
	return {
		deleteOutfit = function(p3)
			-- upvalues: Callback (copy), DeleteOutfitModule (upval)
			Callback(DeleteOutfitModule(p3))
		end,
		setCurrentToastMessage = if FFlagAXUpdateSlotBasedEditorToastAndPrompts then function(p3)
			-- upvalues: Callback (copy), SetCurrentToastMessageFunction (upval)
			Callback(SetCurrentToastMessageFunction(p3))
		end else nil
	}
end)(DeleteOutfitPrompt))))))))