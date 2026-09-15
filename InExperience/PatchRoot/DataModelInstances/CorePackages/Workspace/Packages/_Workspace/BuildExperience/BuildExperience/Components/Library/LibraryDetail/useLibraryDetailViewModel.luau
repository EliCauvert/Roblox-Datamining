local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local _ = require(buildExperience.Components.Library.LibraryDataStore)
local libraryTypesModule = require(buildExperience.Components.Library.LibraryTypes)
local useDataLibraryModule = require(buildExperience.Components.Library.useDataLibrary)
local useLibraryModelPreviewRenderingModule = require(buildExperience.Components.Library.useLibraryModelPreviewRendering)
local _ = require(script.Parent.LibraryDetailView)
local _ = require(buildExperience.Chat.chatTypes)
local localizationStringsModule = require(buildExperience.LocalizationStrings)

return function(p1, p2)
	-- upvalues: userInputService (ref), guiService (ref), reactModule (ref), useLocalization (ref), localizationStringsModule (ref), useDataLibraryModule (ref), signalsReactModule (ref), libraryTypesModule (ref), useLibraryModelPreviewRenderingModule (ref)
	local var1 = if p2 ~= nil then userInputService else p2.userInputService
	local var2 = if p2 ~= nil then guiService else p2.guiService
	local var3 = p1.chatActions ~= nil
	local var4, var5 = reactModule.useState(0)
	local var6, var7 = reactModule.useState(0)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var5 (ref), var2 (ref), var1 (ref)
		if var3 then
			local function updateKeyboardTop()
				-- upvalues: var2 (copy), var5 (copy), var1 (copy)
				var5(if var1.OnScreenKeyboardVisible then math.max(0, var1.OnScreenKeyboardPosition.Y - var2:GetGuiInset().Y) else 0)
			end
			
			var5(if var1.OnScreenKeyboardVisible then math.max(0, var1.OnScreenKeyboardPosition.Y - var2:GetGuiInset().Y) else 0)
			local var8 = var1:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(updateKeyboardTop)
			local var9 = var1:GetPropertyChangedSignal("OnScreenKeyboardSize"):Connect(updateKeyboardTop)
			local var10 = var1:GetPropertyChangedSignal("OnScreenKeyboardPosition"):Connect(updateKeyboardTop)
			
			return function()
				-- upvalues: var8 (ref), var9 (ref), var10 (ref)
				var8:Disconnect()
				var9:Disconnect()
				var10:Disconnect()
			end
		end
		var5(0)
	end, { var3, var1, var2 })
	local var8 = reactModule.useCallback(function(p3)
		-- upvalues: var7 (ref)
		var7(p3.AbsolutePosition.Y + p3.AbsoluteSize.Y)
	end, {})
	local var9 = if var3 and var4 > 0 and var6 > 0 then math.max(0, var6 - var4) else 0
	local var10 = useLocalization({
		composerPlaceholder = localizationStringsModule.CHAT_COMPOSER_PLACEHOLDER
	})
	local chatActions = p1.chatActions
	
	if chatActions ~= nil and (chatActions.placeholder == nil or chatActions.placeholder == "") then
		chatActions = table.clone(chatActions)
		chatActions.placeholder = var10.composerPlaceholder
	end
	local var11 = useDataLibraryModule({ source = p1.source })
	local var12 = reactModule.useMemo(function()
		-- upvalues: var11 (ref), p1 (ref)
		return {
			offset = 0,
			limit = 1,
			source = var11.source,
			itemKind = p1.itemKind,
			ids = { p1.itemId }
		}
	end, { var11.source, p1.itemKind, p1.itemId, var11.status })
	local var13 = signalsReactModule.useSignalState(var11.getItem({ source = var11.source, itemId = p1.itemId }).data)
	local var14 = reactModule.useMemo(function()
		-- upvalues: var11 (ref), var12 (ref), p1 (ref)
		local var15 = var11.getItem({ source = var12.source, itemId = p1.itemId }).data(false)
		
		return if var15 ~= nil then var15.kind == "Model" and var15.model == nil else true
	end, { var12, var11.getItem, p1.itemId })
	local list = var11.getList(var12)
	local var15 = signalsReactModule.useSignalState(list.data)
	local var16 = signalsReactModule.useSignalState(list.status)
	reactModule.useEffect(function()
		-- upvalues: var14 (ref), var11 (ref), var12 (ref)
		if var14 and var11.status == "Ready" then
			var11.getAndFetchList(var12)
		end
	end, { var12, var14, var11.status, var11.getAndFetchList })
	local var17 = var14 and (var16 == "Ready" and (if var15 ~= nil then table.find(var15.itemIds, p1.itemId) == nil else true))
	local var18 = if var17 then nil else var13
	local var19 = var14 and (if var16 ~= "Failed" then var15 ~= nil and var15.previewError ~= nil else true)
	local var20 = var14 and (var16 ~= "Ready" and var16 ~= "Failed")
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var18 (ref), libraryTypesModule (copy)
		local referenceActions = p1.referenceActions
		
		if var18 == nil then
			return
		end
		local var21 = libraryTypesModule.toChatReference(var18)
		local var22 = referenceActions.onAddReference(var21) == true
		
		return function()
			-- upvalues: var22 (ref), referenceActions (ref), var21 (ref)
			if var22 then
				referenceActions.onRemoveReference(var21)
			end
		end
	end, {
		var18 or false,
		p1.referenceActions,
		p1.source.kind,
		p1.source.placeId
	})
	reactModule.useEffect(function()
		-- upvalues: var18 (ref), p1 (ref)
		if var18 == nil or var18.model == nil then
			return nil
		end
		local destroyingConnection = var18.model.Destroying:Connect(p1.onBack)
		
		return function()
			-- upvalues: destroyingConnection (ref)
			destroyingConnection:Disconnect()
		end
	end, { var18 or false, p1.onBack })
	local var21 = if var18 == nil or var18.kind ~= "Image" then nil else var18.image
	local var22, var23 = reactModule.useState(nil)
	local var24 = reactModule.useCallback(function(p3)
		-- upvalues: var23 (ref), var21 (ref)
		var23(if p3 == Enum.AssetFetchStatus.Success then nil else var21)
	end, { var21 or false })
	local var25 = if var18 == nil or var18.kind ~= "Sound" then nil else var18.soundId
	local var26 = if var18 == nil or var18.model == nil then nil else {
		id = var18.id,
		displayName = var18.displayName,
		path = var18.path,
		className = var18.className,
		model = var18.model
	}
	local var27 = if var11.status == "Failed" or var19 or var17 then "Failed" elseif var11.status ~= "Ready" or var20 then if var26 == nil and (var18 == nil or var18.kind ~= "Image" or (var18.image == nil or var18.image == "")) and (var18 == nil or var18.kind ~= "Sound" or (var25 == nil or var25 == "")) then "Failed" else "Ready" else "Loading"
	useLibraryModelPreviewRenderingModule(var27 == "Ready" and (var26 ~= nil and p1.isActive ~= false))
	
	return {
		keyboardOverlap = var9,
		onPageMetricsChanged = var8,
		liveModel = var26,
		image = var21,
		imageLoadFailed = var21 ~= nil and var22 == var21,
		onImageLoaded = var24,
		soundId = var25,
		modelName = if var18 ~= nil then nil else var18.displayName,
		status = var27,
		unavailableText = p1.unavailableText,
		onBack = p1.onBack,
		onSeeInWorld = p1.onSeeInWorld,
		chatActions = chatActions,
		presentation = p1.presentation
	}
end