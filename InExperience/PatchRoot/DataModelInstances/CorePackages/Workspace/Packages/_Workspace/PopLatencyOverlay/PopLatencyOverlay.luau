local ReactModule = require(script.Parent.React)
local Players = game:GetService("Players")
local ContentProvider = game:GetService("ContentProvider")
local HttpRbxApiService = game:GetService("HttpRbxApiService")
local HttpService = game:GetService("HttpService")
local GameplayOverlayModule = require(script.GameplayOverlay)
local OverlayModule = require(script.Overlay)
local FetchAdminStatusModule = require(script.fetchAdminStatus)
local ObserveAdminStatusModule = require(script.observeAdminStatus)

local function isUserAdmin(p1)
	-- upvalues: FetchAdminStatusModule (copy), HttpRbxApiService (copy), HttpService (copy), ContentProvider (copy)
	return FetchAdminStatusModule(p1, HttpRbxApiService, HttpService, ContentProvider.BaseUrl)
end

local function PopLatencyOverlay(p1)
	-- upvalues: ReactModule (copy), OverlayModule (copy)
	return ReactModule.createElement("ScreenGui", {
		Name = "PopLatencyOverlay",
		IgnoreGuiInset = true,
		ResetOnSpawn = false,
		DisplayOrder = 1000
	}, ReactModule.createElement(OverlayModule, p1))
end

local function useAdminAuthorization()
	-- upvalues: ReactModule (copy), ObserveAdminStatusModule (copy), Players (copy), isUserAdmin (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: ObserveAdminStatusModule (upval), Players (upval), isUserAdmin (upval), UseStateResult2 (copy), UseRefResult (copy)
		local ObserveAdminStatusModuleResult2
		UseRefResult.current, ObserveAdminStatusModuleResult2 = ObserveAdminStatusModule(Players, isUserAdmin, function()
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(function(p1: number): number
				return p1 + 1
			end)
		end)
		
		return function()
			-- upvalues: UseRefResult (upval), ObserveAdminStatusModuleResult2 (copy)
			UseRefResult.current = nil
			ObserveAdminStatusModuleResult2()
		end
	end, {})
	
	return ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy)
		local CurrentFunction = UseRefResult.current
		
		return CurrentFunction ~= nil and CurrentFunction()
	end, {}), UseStateResult
end

local function GameplayPopLatencyOverlay(p1)
	-- upvalues: ReactModule (copy), GameplayOverlayModule (copy)
	return ReactModule.createElement("ScreenGui", {
		Name = "GameplayPopLatencyOverlay",
		ResetOnSpawn = false,
		DisplayOrder = 1000
	}, ReactModule.createElement(GameplayOverlayModule, p1))
end

return {
	["jest.config"] = script["jest.config"],
	adminOnly = function(_)
		-- upvalues: useAdminAuthorization (copy), ReactModule (copy), PopLatencyOverlay (copy)
		local UseAdminAuthorizationResult, UseAdminAuthorizationResult2 = useAdminAuthorization()
		
		return ReactModule.createElement(PopLatencyOverlay, {
			deferServiceUntilToggle = true,
			failClosedOnProbeCheck = true,
			authorizationVersion = UseAdminAuthorizationResult2,
			authorizeToggle = UseAdminAuthorizationResult
		})
	end,
	default = PopLatencyOverlay,
	gameplay = GameplayPopLatencyOverlay,
	gameplayAdminOnly = function(p1)
		-- upvalues: useAdminAuthorization (copy), ReactModule (copy), GameplayPopLatencyOverlay (copy)
		local UseAdminAuthorizationResult, UseAdminAuthorizationResult2 = useAdminAuthorization()
		
		return ReactModule.createElement(GameplayPopLatencyOverlay, {
			experienceService = p1.experienceService,
			authorizationVersion = UseAdminAuthorizationResult2,
			authorizeToggle = UseAdminAuthorizationResult
		})
	end
}