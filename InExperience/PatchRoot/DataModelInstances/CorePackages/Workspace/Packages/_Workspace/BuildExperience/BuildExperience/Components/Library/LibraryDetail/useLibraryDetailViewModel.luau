local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local _ = require(BuildExperience.Stores.BuildLibrary.createBuildLibraryStore)
local LibraryTypesModule = require(BuildExperience.Components.Library.LibraryTypes)
local _ = require(script.Parent.LibraryDetailView)
local _ = require(BuildExperience.Chat.chatTypes)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)

return function(p1, p2) --[[ Line: 36 | Named "useLibraryDetailViewModel" ]]
	-- upvalues: UserInputService (copy), GuiService (copy), ReactModule (copy), UseLocalizationFunction (copy), LocalizationStringsModule (copy), SignalsReactModule (copy), LibraryTypesModule (copy)
	local UserInputService1 = if p2 == nil then UserInputService else p2.userInputService
	local GuiService1 = if p2 == nil then GuiService else p2.guiService
	local IsIsActive = p1.isActive ~= false
	local HasChatActions = p1.chatActions ~= nil
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
	ReactModule.useEffect(function() --[[ Line: 49 ]]
		-- upvalues: HasChatActions (copy), UseStateResult2 (copy), GuiService1 (copy), UserInputService1 (copy)
		if not HasChatActions then
			UseStateResult2(0)
			
			return
		end
		local function updateKeyboardTop() --[[ Line: 54 ]]
			-- upvalues: GuiService1 (upval), UseStateResult2 (upval), UserInputService1 (upval)
			local GuiInset = GuiService1:GetGuiInset()
			UseStateResult2(if UserInputService1.OnScreenKeyboardVisible then math.max(0, UserInputService1.OnScreenKeyboardPosition.Y - GuiInset.Y) else 0)
		end
		
		local GuiInset = GuiService1:GetGuiInset()
		UseStateResult2(if UserInputService1.OnScreenKeyboardVisible then math.max(0, UserInputService1.OnScreenKeyboardPosition.Y - GuiInset.Y) else 0)
		local Connection = UserInputService1:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(updateKeyboardTop)
		local Connection1 = UserInputService1:GetPropertyChangedSignal("OnScreenKeyboardSize"):Connect(updateKeyboardTop)
		local Connection2 = UserInputService1:GetPropertyChangedSignal("OnScreenKeyboardPosition"):Connect(updateKeyboardTop)
		
		return function() --[[ Line: 69 ]]
			-- upvalues: Connection (copy), Connection1 (copy), Connection2 (copy)
			Connection:Disconnect()
			Connection1:Disconnect()
			Connection2:Disconnect()
		end
	end, { HasChatActions, UserInputService1, GuiService1 })
	local UseResult = ReactModule.useCallback(function(Frame: Frame) --[[ Line: 75 ]]
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(Frame.AbsolutePosition.Y + Frame.AbsoluteSize.Y)
	end, {})
	local Largest: number = if HasChatActions and UseStateResult > 0 and UseStateResult1 > 0 then math.max(0, UseStateResult1 - UseStateResult) else 0
	local UseLocalizationResult = UseLocalizationFunction({
		soundLabel = "Feature.Build.Label.Sounds",
		composerPlaceholder = LocalizationStringsModule.CHAT_COMPOSER_PLACEHOLDER
	})
	local ChatActions = p1.chatActions
	
	if ChatActions ~= nil and (ChatActions.placeholder == nil or ChatActions.placeholder == "") then
		ChatActions = table.clone(ChatActions)
		ChatActions.placeholder = UseLocalizationResult.composerPlaceholder
	end
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useCallback(function(p3) --[[ Line: 93 ]]
		-- upvalues: p1 (copy)
		return p1.library.getItem(p3, p1.itemId)
	end, { p1.library, p1.itemId })))
	local UseSignalStateResult1 = if p1.isReady then UseSignalStateResult else nil
	ReactModule.useEffect(function() --[[ Line: 99 ]]
		-- upvalues: p1 (copy), UseSignalStateResult1 (copy), IsIsActive (copy), LibraryTypesModule (upval)
		local ResourceActions = p1.resourceActions
		
		if UseSignalStateResult1 == nil or not IsIsActive then return end
		local ChatResource = LibraryTypesModule.toChatResource(UseSignalStateResult1)
		local IsOnAddResourceResult = ResourceActions.onAddResource(ChatResource) == true
		
		return function() --[[ Line: 106 ]]
			-- upvalues: IsOnAddResourceResult (copy), ResourceActions (copy), ChatResource (copy)
			if IsOnAddResourceResult then
				ResourceActions.onRemoveResource(ChatResource)
			end
		end
	end, {
		UseSignalStateResult1 or false,
		p1.resourceActions,
		p1.library,
		IsIsActive
	})
	ReactModule.useEffect(function() --[[ Line: 113 ]]
		-- upvalues: UseSignalStateResult1 (copy), IsIsActive (copy), p1 (copy)
		if UseSignalStateResult1 == nil or UseSignalStateResult1.model == nil or not IsIsActive then
			return nil
		else
			local DestroyingConnection = UseSignalStateResult1.model.Destroying:Connect(p1.onBack)
			
			return function() --[[ Line: 118 ]]
				-- upvalues: DestroyingConnection (copy)
				DestroyingConnection:Disconnect()
			end
		end
	end, { UseSignalStateResult1 or false, p1.onBack, IsIsActive })
	local Image = if UseSignalStateResult1 == nil or UseSignalStateResult1.kind ~= "Image" then nil else UseSignalStateResult1.image
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(nil)
	local SoundId = if UseSignalStateResult1 == nil or UseSignalStateResult1.kind ~= "Sound" then nil else UseSignalStateResult1.soundId
	local Config = if UseSignalStateResult1 == nil or UseSignalStateResult1.model == nil then nil else {
		id = UseSignalStateResult1.id,
		displayName = UseSignalStateResult1.displayName,
		path = UseSignalStateResult1.path,
		className = UseSignalStateResult1.className,
		model = UseSignalStateResult1.model
	}
	
	return {
		isActive = IsIsActive,
		keyboardOverlap = Largest,
		onPageMetricsChanged = UseResult,
		liveModel = Config,
		image = Image,
		imageLoadFailed = Image ~= nil and UseStateResult3 == Image,
		onImageLoaded = ReactModule.useCallback(function(AssetFetchStatus) --[[ Line: 125 ]]
			-- upvalues: UseStateResult2_2 (copy), Image (copy)
			UseStateResult2_2(if AssetFetchStatus == Enum.AssetFetchStatus.Success then nil else Image)
		end, { Image or false }),
		soundId = SoundId,
		modelName = if UseSignalStateResult1 == nil then nil else UseSignalStateResult1.displayName,
		description = if UseSignalStateResult1 == nil then nil else UseSignalStateResult1.description,
		status = if p1.isReady then if Config == nil and (UseSignalStateResult1 == nil or UseSignalStateResult1.kind ~= "Image" or UseSignalStateResult1.image == nil or UseSignalStateResult1.image == "") and (UseSignalStateResult1 == nil or UseSignalStateResult1.kind ~= "Sound" or SoundId == nil or SoundId == "") then "Failed" else "Ready" else "Loading",
		unavailableText = p1.unavailableText,
		soundLabel = UseLocalizationResult.soundLabel,
		chatActions = ChatActions
	}
end