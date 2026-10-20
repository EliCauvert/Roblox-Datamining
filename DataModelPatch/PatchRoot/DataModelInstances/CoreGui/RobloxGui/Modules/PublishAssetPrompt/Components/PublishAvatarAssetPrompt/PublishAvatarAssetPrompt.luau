local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local ReactModule = require(CorePackages.Packages.React)
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local MutedErrorFunction = require(CorePackages.Workspace.Packages.Loggers).mutedError
local Parent = script.Parent.Parent
local BasePublishPromptModule = require(Parent.BasePublishPrompt)
local ObjectViewportModule = require(Parent.Common.ObjectViewport)
local LabeledTextBoxModule = require(Parent.Common.LabeledTextBox)
local PublishInfoListModule = require(Parent.Common.PublishInfoList)
local PurchasePromptModule = require(CorePackages.Workspace.Packages.PurchasePrompt)
local PublishAssetAnalytics = PurchasePromptModule.PublishAssetAnalytics
local Parent1 = Parent.Parent
local SetPromptVisibilityModule = require(Parent1.Actions.SetPromptVisibility)
local RoactUtilsModule = require(CorePackages.Workspace.Packages.RoactUtils)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local ConstantsModule = require(Parent1.Constants)
local MakeupPreviewUtilsModule = require(Parent1.MakeupPreviewUtils)
local MakeupPartGridModule = require(Parent.Common.MakeupPartGrid)
local GetFFlagSingleUploadMakeupSupportModule = require(Parent1.Flags.GetFFlagSingleUploadMakeupSupport)
local _UDim = UDim.new(0, 20)

return function(p1)
	-- upvalues: Players (copy), UseSelectorFunction (copy), UseDispatchFunction (copy), ConstantsModule (copy), ReactModule (copy), GetFFlagSingleUploadMakeupSupportModule (copy), MakeupPreviewUtilsModule (copy), PublishAssetAnalytics (copy), PurchasePromptModule (copy), MutedErrorFunction (copy), SetPromptVisibilityModule (copy), RobloxTranslatorModule (copy), _UDim (copy), ObjectViewportModule (copy), LabeledTextBoxModule (copy), PublishInfoListModule (copy), MakeupPartGridModule (copy), BasePublishPromptModule (copy)
	local LocalPlayer = Players.LocalPlayer
	assert(LocalPlayer, "LocalPlayer must not be nil")
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.promptRequest.promptInfo
	end)
	local UseDispatchResult = UseDispatchFunction()
	local Text = LocalPlayer.Name .. "'s " .. ConstantsModule.AvatarAssetTypeDefaultName[UseSelectorResult.accessoryType]
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(Text)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(true)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(Text)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(true)
	local UseStateResult6, UseStateResult2_5 = ReactModule.useState(false)
	local UseStateResult7, UseStateResult2_6 = ReactModule.useState(true)
	local IsMakeupAssetType = if GetFFlagSingleUploadMakeupSupportModule() then MakeupPreviewUtilsModule.isMakeupAssetType(UseSelectorResult.accessoryType) else false
	local UseStateResult8, UseStateResult2_7 = ReactModule.useState(nil)
	ReactModule.useEffect(function()
		-- upvalues: IsMakeupAssetType (copy), UseSelectorResult (copy), MakeupPreviewUtilsModule (upval), UseStateResult2_7 (copy)
		if IsMakeupAssetType and UseSelectorResult.accessoryInstance then
			local MakeupHeadPreview = MakeupPreviewUtilsModule.createMakeupHeadPreview(UseSelectorResult.accessoryInstance, UseSelectorResult.accessoryType)
			UseStateResult2_7(MakeupHeadPreview)
			
			return function()
				-- upvalues: MakeupHeadPreview (copy)
				if MakeupHeadPreview then
					MakeupHeadPreview:Destroy()
				end
			end
		else
			return function() end
		end
	end, {
		UseSelectorResult.accessoryInstance,
		IsMakeupAssetType,
		UseSelectorResult.accessoryType
	})
	local UseStateResult9 = if IsMakeupAssetType then UseStateResult8 else UseSelectorResult.accessoryInstance
	local UseRefResult = ReactModule.useRef(false)
	local UseRefResult1 = ReactModule.useRef(false)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: PublishAssetAnalytics (upval), UseStateResult2 (copy)
		PublishAssetAnalytics.sendButtonClicked(PublishAssetAnalytics.Section.BuyCreationPage, PublishAssetAnalytics.Element.Expand)
		UseStateResult2(true)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult3 (copy), UseStateResult5 (copy), UseSelectorResult (copy), UseStateResult7 (copy)
		return UseStateResult3 and (UseStateResult5 and (UseSelectorResult.accessoryInstance ~= nil and UseStateResult7))
	end, {
		UseStateResult3,
		UseStateResult5,
		UseSelectorResult.accessoryInstance,
		UseStateResult7
	})
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: PublishAssetAnalytics (upval), UseStateResult1 (copy), UseStateResult4 (copy), PurchasePromptModule (upval), UseSelectorResult (copy), UseStateResult9 (copy), MutedErrorFunction (upval)
		PublishAssetAnalytics.sendButtonClicked(PublishAssetAnalytics.Section.BuyCreationPage, PublishAssetAnalytics.Element.Buy)
		local config = { name = UseStateResult1, description = UseStateResult4 }
		
		if PurchasePromptModule.initiateAvatarCreationFeePurchase then
			PurchasePromptModule.initiateAvatarCreationFeePurchase(config, UseSelectorResult.guid, UseStateResult9, UseSelectorResult.priceInRobux)
			
			return
		else
			MutedErrorFunction("PurchasePrompt.initiateAvatarCreationFeePurchase is not available")
		end
	end, {
		UseStateResult1, UseStateResult4, UseSelectorResult.guid,
		UseSelectorResult.accessoryInstance, UseSelectorResult.priceInRobux,
		UseStateResult9
	})
	local UseResult4 = ReactModule.useCallback(function(p2, p3)
		-- upvalues: UseStateResult2_1 (copy), UseStateResult2_2 (copy), UseRefResult (copy), PublishAssetAnalytics (upval)
		UseStateResult2_1(p2)
		UseStateResult2_2(p3)
		
		if not UseRefResult.current then
			UseRefResult.current = true
			PublishAssetAnalytics.sendFieldTouched(PublishAssetAnalytics.Section.BuyCreationPage, PublishAssetAnalytics.Element.Name)
		end
	end, {})
	local UseResult5 = ReactModule.useCallback(function(p2, p3)
		-- upvalues: UseStateResult2_3 (copy), UseStateResult2_4 (copy), UseRefResult1 (copy), PublishAssetAnalytics (upval)
		UseStateResult2_3(p2)
		UseStateResult2_4(p3)
		
		if not UseRefResult1.current then
			UseRefResult1.current = true
			PublishAssetAnalytics.sendFieldTouched(PublishAssetAnalytics.Section.BuyCreationPage, PublishAssetAnalytics.Element.Description)
		end
	end, {})
	
	local function Callback(p2)
		-- upvalues: UseDispatchResult (copy), SetPromptVisibilityModule (upval), UseStateResult2_5 (copy), UseStateResult2_6 (copy)
		local IsShown = p2.isShown
		
		if p2.hasCompletedPurchase and not IsShown then
			UseDispatchResult(SetPromptVisibilityModule(false))
			
			return
		end
		UseStateResult2_5(IsShown)
		
		if IsShown then
			UseStateResult2_6(false)
		end
	end
	
	local function Callback1()
		-- upvalues: UseStateResult2_6 (copy)
		UseStateResult2_6(true)
	end
	
	ReactModule.useEffect(function()
		-- upvalues: PurchasePromptModule (upval), UseRefResult2 (copy), Callback (copy), UseRefResult3 (copy), Callback1 (copy), MutedErrorFunction (upval), PublishAssetAnalytics (upval)
		local WindowStateChangedEvent = PurchasePromptModule.windowStateChangedEvent
		local PromptStateSetToNoneEvent = PurchasePromptModule.promptStateSetToNoneEvent
		
		if WindowStateChangedEvent and PromptStateSetToNoneEvent then
			UseRefResult2.current = WindowStateChangedEvent:Connect(Callback)
			UseRefResult3.current = PromptStateSetToNoneEvent:Connect(Callback1)
		else
			MutedErrorFunction("PurchasePrompt.windowStateChangedEvent or PurchasePrompt.promptStateSetToNoneEvent is not available")
		end
		PublishAssetAnalytics.sendPageLoad(PublishAssetAnalytics.Section.BuyCreationPage)
		
		return function()
			-- upvalues: UseRefResult2 (upval), MutedErrorFunction (upval), UseRefResult3 (upval)
			if UseRefResult2.current then
				UseRefResult2.current:Disconnect()
				UseRefResult2.current = nil
			else
				MutedErrorFunction("windowStateChangedConnection was not established")
			end
			if UseRefResult3.current then
				UseRefResult3.current:Disconnect()
				UseRefResult3.current = nil
				
				return
			else
				MutedErrorFunction("promptStateSetToNoneConnection was not established")
			end
		end
	end, {})
	local Text1 = (if IsMakeupAssetType then RobloxTranslatorModule:FormatByKey("Feature.Catalog.Label.Makeup") else RobloxTranslatorModule:FormatByKey("Feature.Avatar.Label.Accessory")) .. " | " .. RobloxTranslatorModule:FormatByKey(ConstantsModule.AvatarAssetTypeLocalized[UseSelectorResult.accessoryType])
	
	return ReactModule.createElement(BasePublishPromptModule, {
		delayInputSeconds = 3,
		promptBody = ReactModule.useCallback(function()
			-- upvalues: UseStateResult9 (copy), ReactModule (upval), _UDim (upval), ObjectViewportModule (upval), UseResult (copy), GetFFlagSingleUploadMakeupSupportModule (upval), IsMakeupAssetType (copy), LabeledTextBoxModule (upval), RobloxTranslatorModule (upval), UseStateResult4 (copy), UseResult5 (copy), PublishInfoListModule (upval), Text1 (copy), MakeupPartGridModule (upval), UseSelectorResult (copy), UseStateResult1 (copy), p1 (copy)
			return ReactModule.createElement(ReactModule.Fragment, nil, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					Padding = _UDim,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical
				}),
				UIPadding = ReactModule.createElement("UIPadding", { PaddingBottom = _UDim, PaddingTop = _UDim }),
				EmbeddedPreview = ReactModule.createElement(ObjectViewportModule, {
					fieldOfView = 30,
					LayoutOrder = 1,
					openPreviewView = UseResult,
					model = UseStateResult9,
					isLoading = UseStateResult9 == nil,
					useFullBodyCameraSettings = not GetFFlagSingleUploadMakeupSupportModule() or not IsMakeupAssetType
				}),
				DescriptionInput = ReactModule.createElement(LabeledTextBoxModule, {
					LayoutOrder = 2,
					centerText = false,
					maxLength = 1000,
					textBoxHeight = 104,
					labelText = RobloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.Description"),
					defaultText = UseStateResult4,
					onTextUpdated = UseResult5,
					invalidInputText = RobloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.InvalidDescription")
				}),
				InfoList = ReactModule.createElement(PublishInfoListModule, { LayoutOrder = 3, typeName = Text1 }),
				MakeupGrid = IsMakeupAssetType and ReactModule.createElement(MakeupPartGridModule, {
					showAssetTypeInLabel = false,
					LayoutOrder = 4,
					singleDecal = UseSelectorResult.accessoryInstance,
					singleAssetType = UseSelectorResult.accessoryType,
					makeupEntries = {
						{
							sortOrder = 1,
							assetType = UseSelectorResult.accessoryType
						}
					},
					name = UseStateResult1,
					screenSize = p1.screenSize
				}) or nil
			})
		end, {
			UseStateResult9, UseSelectorResult.accessoryType, UseStateResult4,
			if IsMakeupAssetType then UseStateResult1 else nil, IsMakeupAssetType, Text1
		})(),
		screenSize = p1.screenSize,
		showingPreviewView = UseStateResult,
		closePreviewView = UseResult1,
		asset = UseStateResult9,
		nameLabel = RobloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.Name"),
		defaultName = UseStateResult1,
		titleText = RobloxTranslatorModule:FormatByKey("CoreScripts.PublishAvatarPrompt.BuyCreation"),
		onNameUpdated = UseResult4,
		canSubmit = UseResult2,
		onSubmit = UseResult3,
		priceInRobux = UseSelectorResult.priceInRobux,
		showTopScrim = UseStateResult6
	})
end