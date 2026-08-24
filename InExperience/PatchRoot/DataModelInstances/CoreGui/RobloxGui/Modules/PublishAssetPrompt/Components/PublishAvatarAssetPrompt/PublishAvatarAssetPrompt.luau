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
local makeupPartGridModule = require(parent.Common.MakeupPartGrid)
local getFFlagSingleUploadMakeupSupportModule = require(parent_1.Flags.GetFFlagSingleUploadMakeupSupport)
local uDim = UDim.new(0, 20)

return function(value)
	-- upvalues: playersService (ref), useSelector (ref), useDispatch (ref), constantsModule (ref), reactModule (ref), getFFlagSingleUploadMakeupSupportModule (ref), makeupPreviewUtilsModule (ref), publishAssetAnalytics (ref), purchasePromptModule (ref), mutedError (ref), setPromptVisibilityModule (ref), robloxTranslatorModule (ref), uDim (ref), objectViewportModule (ref), labeledTextBoxModule (ref), publishInfoListModule (ref), makeupPartGridModule (ref), basePublishPromptModule (ref)
	local localPlayer = playersService.LocalPlayer
	assert(localPlayer, "LocalPlayer must not be nil")
	local var16 = useSelector(function(p0)
		return p0.promptRequest.promptInfo
	end)
	local var17 = useDispatch()
	local text = localPlayer.Name .. "'s " .. constantsModule.AvatarAssetTypeDefaultName[var16.accessoryType]
	local var19, var20 = reactModule.useState(false)
	local var21, var22 = reactModule.useState(text)
	local var23, var24 = reactModule.useState(true)
	local var25, var26 = reactModule.useState(text)
	local var27, var28 = reactModule.useState(true)
	local var29, var30 = reactModule.useState(false)
	local var31, var32 = reactModule.useState(true)
	local var33 = if getFFlagSingleUploadMakeupSupportModule() then makeupPreviewUtilsModule.isMakeupAssetType(var16.accessoryType) else false
	local var34, var35 = reactModule.useState(nil)
	reactModule.useEffect(function()
		-- upvalues: var33 (ref), var16 (ref), makeupPreviewUtilsModule (copy), var35 (ref)
		if var33 and var16.accessoryInstance then
			local var50 = makeupPreviewUtilsModule.createMakeupHeadPreview(var16.accessoryInstance, var16.accessoryType)
			var35(var50)
			
			return function()
				-- upvalues: var50 (ref)
				if var50 then
					var50:Destroy()
				end
			end
		end
		return function() end
	end, { var16.accessoryInstance, var33, var16.accessoryType })
	local var36 = if var33 then var34 else var16.accessoryInstance
	local var37 = reactModule.useRef(false)
	local var38 = reactModule.useRef(false)
	local var39 = reactModule.useRef(nil)
	local var40 = reactModule.useRef(nil)
	local var41 = reactModule.useCallback(function()
		-- upvalues: publishAssetAnalytics (copy), var20 (ref)
		publishAssetAnalytics.sendButtonClicked(publishAssetAnalytics.Section.BuyCreationPage, publishAssetAnalytics.Element.Expand)
		var20(true)
	end, {})
	local var42 = reactModule.useCallback(function()
		-- upvalues: var20 (ref)
		var20(false)
	end, {})
	local var43 = reactModule.useCallback(function()
		-- upvalues: var23 (ref), var27 (ref), var16 (ref), var31 (ref)
		return var23 and (var27 and (var16.accessoryInstance ~= nil and var31))
	end, { var23, var27, var16.accessoryInstance, var31 })
	local var44 = reactModule.useCallback(function()
		-- upvalues: publishAssetAnalytics (copy), var21 (ref), var25 (ref), purchasePromptModule (copy), var16 (ref), var36 (ref), mutedError (copy)
		publishAssetAnalytics.sendButtonClicked(publishAssetAnalytics.Section.BuyCreationPage, publishAssetAnalytics.Element.Buy)
		local t = { name = var21, description = var25 }
		
		if purchasePromptModule.initiateAvatarCreationFeePurchase then
			purchasePromptModule.initiateAvatarCreationFeePurchase(t, var16.guid, var36, var16.priceInRobux)
			
			return
		end
		mutedError("PurchasePrompt.initiateAvatarCreationFeePurchase is not available")
	end, {
		var21, var25, var16.guid, var16.accessoryInstance, var16.priceInRobux, var36
	})
	local var45 = reactModule.useCallback(function(p1, p2)
		-- upvalues: var22 (ref), var24 (ref), var37 (ref), publishAssetAnalytics (copy)
		var22(p1)
		var24(p2)
		
		if not var37.current then
			var37.current = true
			publishAssetAnalytics.sendFieldTouched(publishAssetAnalytics.Section.BuyCreationPage, publishAssetAnalytics.Element.Name)
		end
	end, {})
	local var46 = reactModule.useCallback(function(p3, p4)
		-- upvalues: var26 (ref), var28 (ref), var38 (ref), publishAssetAnalytics (copy)
		var26(p3)
		var28(p4)
		
		if not var38.current then
			var38.current = true
			publishAssetAnalytics.sendFieldTouched(publishAssetAnalytics.Section.BuyCreationPage, publishAssetAnalytics.Element.Description)
		end
	end, {})
	
	local var47 = function(p5)
		-- upvalues: var17 (ref), setPromptVisibilityModule (copy), var30 (ref), var32 (ref)
		local isShown = p5.isShown
		
		if p5.hasCompletedPurchase and not isShown then
			var17(setPromptVisibilityModule(false))
			
			return
		end
		var30(isShown)
		
		if isShown then
			var32(false)
		end
	end
	
	local var48 = function()
		-- upvalues: var32 (ref)
		var32(true)
	end
	
	reactModule.useEffect(function()
		-- upvalues: purchasePromptModule (copy), var39 (ref), var47 (ref), var40 (ref), var48 (ref), mutedError (copy), publishAssetAnalytics (copy)
		local windowStateChangedEvent = purchasePromptModule.windowStateChangedEvent
		local promptStateSetToNoneEvent = purchasePromptModule.promptStateSetToNoneEvent
		
		if windowStateChangedEvent and promptStateSetToNoneEvent then
			var39.current = windowStateChangedEvent:Connect(var47)
			var40.current = promptStateSetToNoneEvent:Connect(var48)
		else
			mutedError("PurchasePrompt.windowStateChangedEvent or PurchasePrompt.promptStateSetToNoneEvent is not available")
		end
		publishAssetAnalytics.sendPageLoad(publishAssetAnalytics.Section.BuyCreationPage)
		
		return function()
			-- upvalues: var39 (copy), mutedError (copy), var40 (copy)
			if var39.current then
				var39.current:Disconnect()
				var39.current = nil
			else
				mutedError("windowStateChangedConnection was not established")
			end
			if var40.current then
				var40.current:Disconnect()
				var40.current = nil
				
				return
			end
			mutedError("promptStateSetToNoneConnection was not established")
		end
	end, {})
	local text_1 = (if var33 then robloxTranslatorModule:FormatByKey("Feature.Catalog.Label.Makeup") else robloxTranslatorModule:FormatByKey("Feature.Avatar.Label.Accessory")) .. " | " .. robloxTranslatorModule:FormatByKey(constantsModule.AvatarAssetTypeLocalized[var16.accessoryType])
	
	return reactModule.createElement(basePublishPromptModule, {
		delayInputSeconds = 3,
		promptBody = reactModule.useCallback(function()
			-- upvalues: var36 (ref), reactModule (copy), uDim (copy), objectViewportModule (copy), var41 (ref), getFFlagSingleUploadMakeupSupportModule (copy), var33 (ref), labeledTextBoxModule (copy), robloxTranslatorModule (copy), var25 (ref), var46 (ref), publishInfoListModule (copy), text_1 (ref), makeupPartGridModule (copy), var16 (ref), var21 (ref), value (ref)
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
					openPreviewView = var41,
					model = var36,
					isLoading = var36 == nil,
					useFullBodyCameraSettings = if getFFlagSingleUploadMakeupSupportModule() then not var33 else true
				}),
				DescriptionInput = reactModule.createElement(labeledTextBoxModule, {
					LayoutOrder = 2,
					centerText = false,
					maxLength = 1000,
					textBoxHeight = 104,
					labelText = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.Description"),
					defaultText = var25,
					onTextUpdated = var46,
					invalidInputText = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.InvalidDescription")
				}),
				InfoList = reactModule.createElement(publishInfoListModule, { LayoutOrder = 3, typeName = text_1 }),
				MakeupGrid = var33 and reactModule.createElement(makeupPartGridModule, {
					showAssetTypeInLabel = false,
					LayoutOrder = 4,
					singleDecal = var16.accessoryInstance,
					singleAssetType = var16.accessoryType,
					makeupEntries = { { sortOrder = 1, assetType = var16.accessoryType } },
					name = var21,
					screenSize = value.screenSize
				}) or nil
			})
		end, {
			var36, var16.accessoryType, var25, if var33 then var21 else nil, var33, text_1
		})(),
		screenSize = value.screenSize,
		showingPreviewView = var19,
		closePreviewView = var42,
		asset = var36,
		nameLabel = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.Name"),
		defaultName = var21,
		titleText = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAvatarPrompt.BuyCreation"),
		onNameUpdated = var45,
		canSubmit = var43,
		onSubmit = var44,
		priceInRobux = var16.priceInRobux,
		showTopScrim = var29
	})
end