local corePackagesService = game:GetService("CorePackages")
local appStorageService = game:GetService("AppStorageService")
local httpService = game:GetService("HttpService")
local reactModule = require(corePackagesService.Packages.React)
local _ = require(corePackagesService.Packages.UIBlox)
local gamepadNavigationDialogModule = require(script.Parent.GamepadNavigationDialog)
local _ = reactModule.PureComponent:extend("GamepadNavigationDialogShowCounter")

local function shouldShowBasedOnCountInAppStorage(p0, p1) --[[ line: 20 ]]
	-- upvalues: appStorageService (ref), httpService (ref)
	local var7 = appStorageService:GetItem(p0)
	local userIdItem = appStorageService:GetItem("UserId")
	local ok, status = pcall(function() --[[ line: 23 ]]
		-- upvalues: httpService (copy), var7 (ref)
		return httpService:JSONDecode(var7)
	end)
	
	if not ok or type(status) ~= "table" then
		status = {}
	end
	local var9 = status[userIdItem]
	
	if type(var9) ~= "number" then
		var9 = 0
	end
	status[userIdItem] = var9 + 1
	
	return var9 < p1, httpService:JSONEncode(status)
end

local function GamepadNavigationDialogTextButton(p2) --[[ line: 43 ]]
	-- upvalues: reactModule (ref), gamepadNavigationDialogModule (ref)
	reactModule.useEffect(function() --[[ line: 44 ]]
		-- upvalues: p2 (ref)
		return p2.onCleanup
	end, {})
	
	return reactModule.createElement("TextButton", {
		Text = "",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0),
		[reactModule.Event.Activated] = p2.onDismissed
	}, {
		GamepadNavigationDialog = reactModule.createElement(gamepadNavigationDialogModule, {
			selectButtonDismissesGamepadNavigationDialog = p2.selectButtonDismissesGamepadNavigationDialog,
			onDismissed = p2.onDismissed
		})
	})
end

return function(p3) --[[ line: 62 | named "GamepadNavigationDialogShowCounter" ]]
	-- upvalues: shouldShowBasedOnCountInAppStorage (ref), reactModule (ref), GamepadNavigationDialogTextButton (ref), appStorageService (ref)
	if not p3.isGamepadNavigationDialogEnabled or not p3.isGamepadNavigationDialogOpen then
		return nil
	end
	local var10, var11 = shouldShowBasedOnCountInAppStorage(p3.appStorageKey, p3.maxShownCount)
	
	return if var10 then reactModule.createElement(GamepadNavigationDialogTextButton, {
		selectButtonDismissesGamepadNavigationDialog = p3.selectButtonDismissesGamepadNavigationDialog,
		onDismissed = function() --[[ line: 74 ]]
			-- upvalues: p3 (ref)
			p3.SetGamepadNavigationDialogOpen(false)
		end,
		onCleanup = function() --[[ line: 77 ]]
			-- upvalues: appStorageService (copy), p3 (ref), var11 (ref)
			appStorageService:SetItem(p3.appStorageKey, var11)
			appStorageService:Flush()
		end
	}) else nil
end