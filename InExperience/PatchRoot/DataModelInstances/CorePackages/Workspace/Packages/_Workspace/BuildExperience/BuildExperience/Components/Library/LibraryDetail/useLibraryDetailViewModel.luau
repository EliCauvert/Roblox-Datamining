local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local _ = require(buildExperience.Stores.BuildLibrary.createBuildLibraryStore)
local libraryTypesModule = require(buildExperience.Components.Library.LibraryTypes)
local _ = require(script.Parent.LibraryDetailView)
local _ = require(buildExperience.Chat.chatTypes)
local localizationStringsModule = require(buildExperience.LocalizationStrings)

return function(p1, p2)
	-- upvalues: userInputService (ref), guiService (ref), reactModule (ref), useLocalization (ref), localizationStringsModule (ref), signalsReactModule (ref), libraryTypesModule (ref)
	local var1 = if p2 ~= nil then userInputService else p2.userInputService
	local var2 = if p2 ~= nil then guiService else p2.guiService
	local var3 = p1.isActive ~= false
	local var4 = p1.chatActions ~= nil
	local var5, var6 = reactModule.useState(0)
	local var7, var8 = reactModule.useState(0)
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var6 (ref), var2 (ref), var1 (ref)
		if var4 then
			local function updateKeyboardTop()
				-- upvalues: var2 (copy), var6 (copy), var1 (copy)
				var6(if var1.OnScreenKeyboardVisible then math.max(0, var1.OnScreenKeyboardPosition.Y - var2:GetGuiInset().Y) else 0)
			end
			
			var6(if var1.OnScreenKeyboardVisible then math.max(0, var1.OnScreenKeyboardPosition.Y - var2:GetGuiInset().Y) else 0)
			local var9 = var1:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(updateKeyboardTop)
			local var10 = var1:GetPropertyChangedSignal("OnScreenKeyboardSize"):Connect(updateKeyboardTop)
			local var11 = var1:GetPropertyChangedSignal("OnScreenKeyboardPosition"):Connect(updateKeyboardTop)
			
			return function()
				-- upvalues: var9 (ref), var10 (ref), var11 (ref)
				var9:Disconnect()
				var10:Disconnect()
				var11:Disconnect()
			end
		end
		var6(0)
	end, { var4, var1, var2 })
	local var9 = reactModule.useCallback(function(p3)
		-- upvalues: var8 (ref)
		var8(p3.AbsolutePosition.Y + p3.AbsoluteSize.Y)
	end, {})
	local var10 = if var4 and var5 > 0 and var7 > 0 then math.max(0, var7 - var5) else 0
	local var11 = useLocalization({
		soundLabel = "Feature.Build.Label.Sounds",
		composerPlaceholder = localizationStringsModule.CHAT_COMPOSER_PLACEHOLDER
	})
	local chatActions = p1.chatActions
	
	if chatActions ~= nil and (chatActions.placeholder == nil or chatActions.placeholder == "") then
		chatActions = table.clone(chatActions)
		chatActions.placeholder = var11.composerPlaceholder
	end
	local var12 = if p1.isReady then signalsReactModule.useSignalState(reactModule.useCallback(function(p3)
		-- upvalues: p1 (ref)
		return p1.library.getItem(p3, p1.itemId)
	end, { p1.library, p1.itemId })) else nil
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var12 (ref), var3 (ref), libraryTypesModule (copy)
		local resourceActions = p1.resourceActions
		
		if var12 == nil or not var3 then
			return
		end
		local var13 = libraryTypesModule.toChatResource(var12)
		local var14 = resourceActions.onAddResource(var13) == true
		
		return function()
			-- upvalues: var14 (ref), resourceActions (ref), var13 (ref)
			if var14 then
				resourceActions.onRemoveResource(var13)
			end
		end
	end, { var12 or false, p1.resourceActions, p1.library, var3 })
	reactModule.useEffect(function()
		-- upvalues: var12 (ref), var3 (ref), p1 (ref)
		if var12 == nil or var12.model == nil or not var3 then
			return nil
		end
		local destroyingConnection = var12.model.Destroying:Connect(p1.onBack)
		
		return function()
			-- upvalues: destroyingConnection (ref)
			destroyingConnection:Disconnect()
		end
	end, { var12 or false, p1.onBack, var3 })
	local var13 = if var12 == nil or var12.kind ~= "Image" then nil else var12.image
	local var14, var15 = reactModule.useState(nil)
	local var16 = reactModule.useCallback(function(p3)
		-- upvalues: var15 (ref), var13 (ref)
		var15(if p3 == Enum.AssetFetchStatus.Success then nil else var13)
	end, { var13 or false })
	local var17 = if var12 == nil or var12.kind ~= "Sound" then nil else var12.soundId
	local var18 = if var12 == nil or var12.model == nil then nil else {
		id = var12.id,
		displayName = var12.displayName,
		path = var12.path,
		className = var12.className,
		model = var12.model
	}
	
	return {
		isActive = var3,
		keyboardOverlap = var10,
		onPageMetricsChanged = var9,
		liveModel = var18,
		image = var13,
		imageLoadFailed = var13 ~= nil and var14 == var13,
		onImageLoaded = var16,
		soundId = var17,
		modelName = if var12 ~= nil then nil else var12.displayName,
		description = if var12 ~= nil then nil else var12.description,
		status = if not p1.isReady then if var18 == nil and (var12 == nil or var12.kind ~= "Image" or (var12.image == nil or var12.image == "")) and (var12 == nil or var12.kind ~= "Sound" or (var17 == nil or var17 == "")) then "Failed" else "Ready" else "Loading",
		unavailableText = p1.unavailableText,
		soundLabel = var11.soundLabel,
		chatActions = chatActions
	}
end