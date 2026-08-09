local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local reactModule = require(corePackagesService.Packages.React)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local mutedError = require(corePackagesService.Workspace.Packages.Loggers).mutedError
local parent = script.Parent.Parent
local basePublishPromptModule = require(parent.BasePublishPrompt)
local objectViewportModule = require(parent.Common.ObjectViewport)
local labeledTextBoxModule = require(parent.Common.LabeledTextBox)
local publishInfoListModule = require(parent.Common.PublishInfoList)
local purchasePromptModule = require(corePackagesService.Workspace.Packages.PurchasePrompt)
local publishAssetAnalytics = purchasePromptModule.PublishAssetAnalytics
local parent_1 = parent.Parent
local setPromptVisibilityModule = require(parent_1.Actions.SetPromptVisibility)
local roactUtilsModule = require(corePackagesService.Workspace.Packages.RoactUtils)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local constantsModule = require(parent_1.Constants)
local makeupPreviewUtilsModule = require(parent_1.MakeupPreviewUtils)
local getFFlagSingleUploadMakeupSupportModule = require(parent_1.Flags.GetFFlagSingleUploadMakeupSupport)
local uDim = UDim.new(0, 20)

return function(value) --[[ line: 46 | named "PublishAvatarAssetPrompt" ]]
	-- upvalues: playersService (ref), useSelector (ref), useDispatch (ref), constantsModule (ref), reactModule (ref), getFFlagSingleUploadMakeupSupportModule (ref), makeupPreviewUtilsModule (ref), publishAssetAnalytics (ref), purchasePromptModule (ref), mutedError (ref), setPromptVisibilityModule (ref), robloxTranslatorModule (ref), uDim (ref), objectViewportModule (ref), labeledTextBoxModule (ref), publishInfoListModule (ref), basePublishPromptModule (ref)
	local localPlayer = playersService.LocalPlayer
	assert(localPlayer, "LocalPlayer must not be nil")
	local var15 = useSelector(function(p0) --[[ line: 51 ]]
		return p0.promptRequest.promptInfo
	end)
	local var16 = useDispatch()
	local text = localPlayer.Name .. "'s " .. constantsModule.AvatarAssetTypeDefaultName[var15.accessoryType]
	local var18, var19 = reactModule.useState(false)
	local var20, var21 = reactModule.useState(text)
	local var22, var23 = reactModule.useState(true)
	local var24, var25 = reactModule.useState(text)
	local var26, var27 = reactModule.useState(true)
	local var28, var29 = reactModule.useState(false)
	local var30, var31 = reactModule.useState(true)
	local var32 = if getFFlagSingleUploadMakeupSupportModule() then makeupPreviewUtilsModule.isMakeupAssetType(var15.accessoryType) else false
	local var33, var34 = reactModule.useState(nil)
	reactModule.useEffect(function() --[[ line: 76 ]]
		-- upvalues: var32 (ref), var15 (ref), makeupPreviewUtilsModule (copy), var34 (ref)
		if var32 and var15.accessoryInstance then
			local var49 = makeupPreviewUtilsModule.createMakeupHeadPreview(var15.accessoryInstance, var15.accessoryType)
			var34(var49)
			
			return function() --[[ line: 85 ]]
				-- upvalues: var49 (ref)
				if var49 then
					var49:Destroy()
				end
			end
		end
		return function() --[[ line: 78 ]] end
	end, { var15.accessoryInstance, var32, var15.accessoryType })
	local var35 = if var32 then var33 else var15.accessoryInstance
	local var36 = reactModule.useRef(false)
	local var37 = reactModule.useRef(false)
	local var38 = reactModule.useRef(nil)
	local var39 = reactModule.useRef(nil)
	local var40 = reactModule.useCallback(function() --[[ line: 101 ]]
		-- upvalues: publishAssetAnalytics (copy), var19 (ref)
		publishAssetAnalytics.sendButtonClicked(publishAssetAnalytics.Section.BuyCreationPage, publishAssetAnalytics.Element.Expand)
		var19(true)
	end, {})
	local var41 = reactModule.useCallback(function() --[[ line: 106 ]]
		-- upvalues: var19 (ref)
		var19(false)
	end, {})
	local var42 = reactModule.useCallback(function() --[[ line: 110 ]]
		-- upvalues: var22 (ref), var26 (ref), var15 (ref), var30 (ref)
		return var22 and (var26 and (var15.accessoryInstance ~= nil and var30))
	end, { var22, var26, var15.accessoryInstance, var30 })
	local var43 = reactModule.useCallback(function() --[[ line: 115 ]]
		-- upvalues: publishAssetAnalytics (copy), var20 (ref), var24 (ref), purchasePromptModule (copy), var15 (ref), var35 (ref), mutedError (copy)
		publishAssetAnalytics.sendButtonClicked(publishAssetAnalytics.Section.BuyCreationPage, publishAssetAnalytics.Element.Buy)
		local t = { name = var20, description = var24 }
		
		if purchasePromptModule.initiateAvatarCreationFeePurchase then
			purchasePromptModule.initiateAvatarCreationFeePurchase(t, var15.guid, var35, var15.priceInRobux)
			
			return
		end
		mutedError("PurchasePrompt.initiateAvatarCreationFeePurchase is not available")
	end, {
		var20, var24, var15.guid, var15.accessoryInstance, var15.priceInRobux, var35
	})
	local var44 = reactModule.useCallback(function(p1, p2) --[[ line: 137 ]]
		-- upvalues: var21 (ref), var23 (ref), var36 (ref), publishAssetAnalytics (copy)
		var21(p1)
		var23(p2)
		
		if not var36.current then
			var36.current = true
			publishAssetAnalytics.sendFieldTouched(publishAssetAnalytics.Section.BuyCreationPage, publishAssetAnalytics.Element.Name)
		end
	end, {})
	local var45 = reactModule.useCallback(function(p3, p4) --[[ line: 147 ]]
		-- upvalues: var25 (ref), var27 (ref), var37 (ref), publishAssetAnalytics (copy)
		var25(p3)
		var27(p4)
		
		if not var37.current then
			var37.current = true
			publishAssetAnalytics.sendFieldTouched(publishAssetAnalytics.Section.BuyCreationPage, publishAssetAnalytics.Element.Description)
		end
	end, {})
	
	local var46 = function(p5) --[[ line: 157 ]]
		-- upvalues: var16 (ref), setPromptVisibilityModule (copy), var29 (ref), var31 (ref)
		local isShown = p5.isShown
		
		if p5.hasCompletedPurchase and not isShown then
			var16(setPromptVisibilityModule(false))
			
			return
		end
		var29(isShown)
		
		if isShown then
			var31(false)
		end
	end
	
	local var47 = function() --[[ line: 171 ]]
		-- upvalues: var31 (ref)
		var31(true)
	end
	
	reactModule.useEffect(function() --[[ line: 176 ]]
		-- upvalues: purchasePromptModule (copy), var38 (ref), var46 (ref), var39 (ref), var47 (ref), mutedError (copy), publishAssetAnalytics (copy)
		local windowStateChangedEvent = purchasePromptModule.windowStateChangedEvent
		local promptStateSetToNoneEvent = purchasePromptModule.promptStateSetToNoneEvent
		
		if windowStateChangedEvent and promptStateSetToNoneEvent then
			var38.current = windowStateChangedEvent:Connect(var46)
			var39.current = promptStateSetToNoneEvent:Connect(var47)
		else
			mutedError("PurchasePrompt.windowStateChangedEvent or PurchasePrompt.promptStateSetToNoneEvent is not available")
		end
		publishAssetAnalytics.sendPageLoad(publishAssetAnalytics.Section.BuyCreationPage)
		
		return function() --[[ line: 190 ]]
			-- upvalues: var38 (copy), mutedError (copy), var39 (copy)
			if var38.current then
				var38.current:Disconnect()
				var38.current = nil
			else
				mutedError("windowStateChangedConnection was not established")
			end
			if var39.current then
				var39.current:Disconnect()
				var39.current = nil
				
				return
			end
			mutedError("promptStateSetToNoneConnection was not established")
		end
	end, {})
	local text_1 = (if var32 then robloxTranslatorModule:FormatByKey("Feature.Catalog.Label.Makeup") else robloxTranslatorModule:FormatByKey("Feature.Avatar.Label.Accessory")) .. " | " .. robloxTranslatorModule:FormatByKey(constantsModule.AvatarAssetTypeLocalized[var15.accessoryType])
	
	return reactModule.createElement(basePublishPromptModule, {
		delayInputSeconds = 3,
		promptBody = reactModule.useCallback(function() --[[ line: 213 ]]
			-- upvalues: var35 (ref), reactModule (copy), uDim (copy), objectViewportModule (copy), var40 (ref), getFFlagSingleUploadMakeupSupportModule (copy), var32 (ref), labeledTextBoxModule (copy), robloxTranslatorModule (copy), var24 (ref), var45 (ref), publishInfoListModule (copy), text_1 (ref)
			return reactModule.createElement(reactModule.Fragment, nil, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					Padding = uDim,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical
				}),
				UIPadding = reactModule.createElement("UIPadding", { PaddingBottom = uDim, PaddingTop = uDim }),
				EmbeddedPreview = reactModule.createElement(objectViewportModule, {
					fieldOfView = 30,
					LayoutOrder = 1,
					openPreviewView = var40,
					model = var35,
					isLoading = var35 == nil,
					useFullBodyCameraSettings = if getFFlagSingleUploadMakeupSupportModule() then not var32 else true
				}),
				DescriptionInput = reactModule.createElement(labeledTextBoxModule, {
					LayoutOrder = 2,
					centerText = false,
					maxLength = 1000,
					textBoxHeight = 104,
					labelText = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.Description"),
					defaultText = var24,
					onTextUpdated = var45,
					invalidInputText = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.InvalidDescription")
				}),
				InfoList = reactModule.createElement(publishInfoListModule, { LayoutOrder = 3, typeName = text_1 })
			})
		end, {
			var35,
			var15.accessoryType,
			var24,
			var32,
			text_1
		})(),
		screenSize = value.screenSize,
		showingPreviewView = var18,
		closePreviewView = var41,
		asset = var35,
		nameLabel = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.Name"),
		defaultName = var20,
		titleText = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAvatarPrompt.BuyCreation"),
		onNameUpdated = var44,
		canSubmit = var42,
		onSubmit = var43,
		priceInRobux = var15.priceInRobux,
		showTopScrim = var28
	})
end