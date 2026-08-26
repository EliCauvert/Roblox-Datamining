local corePackagesService = game:GetService("CorePackages")
local appStorageService = game:GetService("AppStorageService")
local httpService = game:GetService("HttpService")
local reactModule = require(corePackagesService.Packages.React)
local _ = require(corePackagesService.Packages.UIBlox)
local gamepadNavigationDialogModule = require(script.Parent.GamepadNavigationDialog)
local _ = reactModule.PureComponent:extend("GamepadNavigationDialogShowCounter")

local function shouldShowBasedOnCountInAppStorage(p1, p2)
	-- upvalues: appStorageService (ref), httpService (ref)
	local var1 = appStorageService:GetItem(p1)
	local userIdItem = appStorageService:GetItem("UserId")
	local ok, status = pcall(function()
		-- upvalues: httpService (copy), var1 (ref)
		return httpService:JSONDecode(var1)
	end)
	
	if not ok or type(status) ~= "table" then
		status = {}
	end
	local var2 = status[userIdItem]
	
	if type(var2) ~= "number" then
		var2 = 0
	end
	status[userIdItem] = var2 + 1
	
	return var2 < p2, httpService:JSONEncode(status)
end

local function GamepadNavigationDialogTextButton(p1)
	-- upvalues: reactModule (ref), gamepadNavigationDialogModule (ref)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref)
		return p1.onCleanup
	end, {})
	
	return reactModule.createElement("TextButton", {
		Text = "",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0),
		[reactModule.Event.Activated] = p1.onDismissed
	}, {
		GamepadNavigationDialog = reactModule.createElement(gamepadNavigationDialogModule, {
			selectButtonDismissesGamepadNavigationDialog = p1.selectButtonDismissesGamepadNavigationDialog,
			onDismissed = p1.onDismissed
		})
	})
end

return function(p1)
	-- upvalues: shouldShowBasedOnCountInAppStorage (ref), reactModule (ref), GamepadNavigationDialogTextButton (ref), appStorageService (ref)
	if not p1.isGamepadNavigationDialogEnabled or not p1.isGamepadNavigationDialogOpen then
		return nil
	end
	local var1, var2 = shouldShowBasedOnCountInAppStorage(p1.appStorageKey, p1.maxShownCount)
	
	return if var1 then reactModule.createElement(GamepadNavigationDialogTextButton, {
		selectButtonDismissesGamepadNavigationDialog = p1.selectButtonDismissesGamepadNavigationDialog,
		onDismissed = function()
			-- upvalues: p1 (ref)
			p1.SetGamepadNavigationDialogOpen(false)
		end,
		onCleanup = function()
			-- upvalues: appStorageService (copy), p1 (ref), var2 (ref)
			appStorageService:SetItem(p1.appStorageKey, var2)
			appStorageService:Flush()
		end
	}) else nil
end