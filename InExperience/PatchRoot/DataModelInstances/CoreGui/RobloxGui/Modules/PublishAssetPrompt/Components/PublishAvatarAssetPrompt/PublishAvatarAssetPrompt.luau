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
	local var1 = useSelector(function(p1)
		return p1.promptRequest.promptInfo
	end)
	local var2 = useDispatch()
	local text = localPlayer.Name .. "'s " .. constantsModule.AvatarAssetTypeDefaultName[var1.accessoryType]
	local var3, var4 = reactModule.useState(false)
	local var5, var6 = reactModule.useState(text)
	local var7, var8 = reactModule.useState(true)
	local var9, var10 = reactModule.useState(text)
	local var11, var12 = reactModule.useState(true)
	local var13, var14 = reactModule.useState(false)
	local var15, var16 = reactModule.useState(true)
	local var17 = if getFFlagSingleUploadMakeupSupportModule() then makeupPreviewUtilsModule.isMakeupAssetType(var1.accessoryType) else false
	local var18, var19 = reactModule.useState(nil)
	reactModule.useEffect(function()
		-- upvalues: var17 (ref), var1 (ref), makeupPreviewUtilsModule (copy), var19 (ref)
		if var17 and var1.accessoryInstance then
			local var20 = makeupPreviewUtilsModule.createMakeupHeadPreview(var1.accessoryInstance, var1.accessoryType)
			var19(var20)
			
			return function()
				-- upvalues: var20 (ref)
				if var20 then
					var20:Destroy()
				end
			end
		end
		return function() end
	end, { var1.accessoryInstance, var17, var1.accessoryType })
	local var20 = if var17 then var18 else var1.accessoryInstance
	local var21 = reactModule.useRef(false)
	local var22 = reactModule.useRef(false)
	local var23 = reactModule.useRef(nil)
	local var24 = reactModule.useRef(nil)
	local var25 = reactModule.useCallback(function()
		-- upvalues: publishAssetAnalytics (copy), var4 (ref)
		publishAssetAnalytics.sendButtonClicked(publishAssetAnalytics.Section.BuyCreationPage, publishAssetAnalytics.Element.Expand)
		var4(true)
	end, {})
	local var26 = reactModule.useCallback(function()
		-- upvalues: var4 (ref)
		var4(false)
	end, {})
	local var27 = reactModule.useCallback(function()
		-- upvalues: var7 (ref), var11 (ref), var1 (ref), var15 (ref)
		return var7 and (var11 and (var1.accessoryInstance ~= nil and var15))
	end, { var7, var11, var1.accessoryInstance, var15 })
	local var28 = reactModule.useCallback(function()
		-- upvalues: publishAssetAnalytics (copy), var5 (ref), var9 (ref), purchasePromptModule (copy), var1 (ref), var20 (ref), mutedError (copy)
		publishAssetAnalytics.sendButtonClicked(publishAssetAnalytics.Section.BuyCreationPage, publishAssetAnalytics.Element.Buy)
		local t = { name = var5, description = var9 }
		
		if purchasePromptModule.initiateAvatarCreationFeePurchase then
			purchasePromptModule.initiateAvatarCreationFeePurchase(t, var1.guid, var20, var1.priceInRobux)
			
			return
		end
		mutedError("PurchasePrompt.initiateAvatarCreationFeePurchase is not available")
	end, {
		var5, var9, var1.guid, var1.accessoryInstance, var1.priceInRobux, var20
	})
	local var29 = reactModule.useCallback(function(p1, p2)
		-- upvalues: var6 (ref), var8 (ref), var21 (ref), publishAssetAnalytics (copy)
		var6(p1)
		var8(p2)
		
		if not var21.current then
			var21.current = true
			publishAssetAnalytics.sendFieldTouched(publishAssetAnalytics.Section.BuyCreationPage, publishAssetAnalytics.Element.Name)
		end
	end, {})
	local var30 = reactModule.useCallback(function(p1, p2)
		-- upvalues: var10 (ref), var12 (ref), var22 (ref), publishAssetAnalytics (copy)
		var10(p1)
		var12(p2)
		
		if not var22.current then
			var22.current = true
			publishAssetAnalytics.sendFieldTouched(publishAssetAnalytics.Section.BuyCreationPage, publishAssetAnalytics.Element.Description)
		end
	end, {})
	
	local var31 = function(p1)
		-- upvalues: var2 (ref), setPromptVisibilityModule (copy), var14 (ref), var16 (ref)
		local isShown = p1.isShown
		
		if p1.hasCompletedPurchase and not isShown then
			var2(setPromptVisibilityModule(false))
			
			return
		end
		var14(isShown)
		
		if isShown then
			var16(false)
		end
	end
	
	local var32 = function()
		-- upvalues: var16 (ref)
		var16(true)
	end
	
	reactModule.useEffect(function()
		-- upvalues: purchasePromptModule (copy), var23 (ref), var31 (ref), var24 (ref), var32 (ref), mutedError (copy), publishAssetAnalytics (copy)
		local windowStateChangedEvent = purchasePromptModule.windowStateChangedEvent
		local promptStateSetToNoneEvent = purchasePromptModule.promptStateSetToNoneEvent
		
		if windowStateChangedEvent and promptStateSetToNoneEvent then
			var23.current = windowStateChangedEvent:Connect(var31)
			var24.current = promptStateSetToNoneEvent:Connect(var32)
		else
			mutedError("PurchasePrompt.windowStateChangedEvent or PurchasePrompt.promptStateSetToNoneEvent is not available")
		end
		publishAssetAnalytics.sendPageLoad(publishAssetAnalytics.Section.BuyCreationPage)
		
		return function()
			-- upvalues: var23 (copy), mutedError (copy), var24 (copy)
			if var23.current then
				var23.current:Disconnect()
				var23.current = nil
			else
				mutedError("windowStateChangedConnection was not established")
			end
			if var24.current then
				var24.current:Disconnect()
				var24.current = nil
				
				return
			end
			mutedError("promptStateSetToNoneConnection was not established")
		end
	end, {})
	local text_1 = (if var17 then robloxTranslatorModule:FormatByKey("Feature.Catalog.Label.Makeup") else robloxTranslatorModule:FormatByKey("Feature.Avatar.Label.Accessory")) .. " | " .. robloxTranslatorModule:FormatByKey(constantsModule.AvatarAssetTypeLocalized[var1.accessoryType])
	
	return reactModule.createElement(basePublishPromptModule, {
		delayInputSeconds = 3,
		promptBody = reactModule.useCallback(function()
			-- upvalues: var20 (ref), reactModule (copy), uDim (copy), objectViewportModule (copy), var25 (ref), getFFlagSingleUploadMakeupSupportModule (copy), var17 (ref), labeledTextBoxModule (copy), robloxTranslatorModule (copy), var9 (ref), var30 (ref), publishInfoListModule (copy), text_1 (ref), makeupPartGridModule (copy), var1 (ref), var5 (ref), value (ref)
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
					openPreviewView = var25,
					model = var20,
					isLoading = var20 == nil,
					useFullBodyCameraSettings = if getFFlagSingleUploadMakeupSupportModule() then not var17 else true,
					isMakeupPreview = var17
				}),
				DescriptionInput = reactModule.createElement(labeledTextBoxModule, {
					LayoutOrder = 2,
					centerText = false,
					maxLength = 1000,
					textBoxHeight = 104,
					labelText = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.Description"),
					defaultText = var9,
					onTextUpdated = var30,
					invalidInputText = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.InvalidDescription")
				}),
				InfoList = reactModule.createElement(publishInfoListModule, { LayoutOrder = 3, typeName = text_1 }),
				MakeupGrid = var17 and reactModule.createElement(makeupPartGridModule, {
					showAssetTypeInLabel = false,
					LayoutOrder = 4,
					singleDecal = var1.accessoryInstance,
					singleAssetType = var1.accessoryType,
					makeupEntries = { { sortOrder = 1, assetType = var1.accessoryType } },
					name = var5,
					screenSize = value.screenSize
				}) or nil
			})
		end, {
			var20, var1.accessoryType, var9, if var17 then var5 else nil, var17, text_1
		})(),
		screenSize = value.screenSize,
		showingPreviewView = var3,
		closePreviewView = var26,
		isMakeupPreview = var17,
		asset = var20,
		nameLabel = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.Name"),
		defaultName = var5,
		titleText = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAvatarPrompt.BuyCreation"),
		onNameUpdated = var29,
		canSubmit = var27,
		onSubmit = var28,
		priceInRobux = var1.priceInRobux,
		showTopScrim = var13
	})
end