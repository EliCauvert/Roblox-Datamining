local CorePackages = game:GetService("CorePackages")
local AppStorageService = game:GetService("AppStorageService")
local HttpService = game:GetService("HttpService")
local ReactModule = require(CorePackages.Packages.React)
local _ = require(CorePackages.Packages.UIBlox)
local GamepadNavigationDialogModule = require(script.Parent.GamepadNavigationDialog)
local _ = ReactModule.PureComponent:extend("GamepadNavigationDialogShowCounter")

local function shouldShowBasedOnCountInAppStorage(AppStorageKey, MaxShownCount)
	-- upvalues: AppStorageService (copy), HttpService (copy)
	local Item = AppStorageService:GetItem(AppStorageKey)
	local UserIdItem = AppStorageService:GetItem("UserId")
	local Success, Result = pcall(function()
		-- upvalues: HttpService (upval), Item (copy)
		return HttpService:JSONDecode(Item)
	end)
	
	if not Success or type(Result) ~= "table" then
		Result = {}
	end
	local Entry = Result[UserIdItem]
	
	if type(Entry) ~= "number" then
		Entry = 0
	end
	Result[UserIdItem] = Entry + 1
	
	return Entry < MaxShownCount, HttpService:JSONEncode(Result)
end

local function GamepadNavigationDialogTextButton(p1)
	-- upvalues: ReactModule (copy), GamepadNavigationDialogModule (copy)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy)
		return p1.onCleanup
	end, {})
	
	return ReactModule.createElement("TextButton", {
		Text = "",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0),
		[ReactModule.Event.Activated] = p1.onDismissed
	}, {
		GamepadNavigationDialog = ReactModule.createElement(GamepadNavigationDialogModule, {
			selectButtonDismissesGamepadNavigationDialog = p1.selectButtonDismissesGamepadNavigationDialog,
			onDismissed = p1.onDismissed
		})
	})
end

return function(p1)
	-- upvalues: shouldShowBasedOnCountInAppStorage (copy), ReactModule (copy), GamepadNavigationDialogTextButton (copy), AppStorageService (copy)
	if p1.isGamepadNavigationDialogEnabled and p1.isGamepadNavigationDialogOpen then
		local ShouldShowBasedOnCountInAppStorage, ShouldShowBasedOnCountInAppStorage2 = shouldShowBasedOnCountInAppStorage(p1.appStorageKey, p1.maxShownCount)
		
		return if ShouldShowBasedOnCountInAppStorage then ReactModule.createElement(GamepadNavigationDialogTextButton, {
			selectButtonDismissesGamepadNavigationDialog = p1.selectButtonDismissesGamepadNavigationDialog,
			onDismissed = function()
				-- upvalues: p1 (copy)
				p1.SetGamepadNavigationDialogOpen(false)
			end,
			onCleanup = function()
				-- upvalues: AppStorageService (upval), p1 (copy), ShouldShowBasedOnCountInAppStorage2 (copy)
				AppStorageService:SetItem(p1.appStorageKey, ShouldShowBasedOnCountInAppStorage2)
				AppStorageService:Flush()
			end
		}) else nil
	else
		return nil
	end
end