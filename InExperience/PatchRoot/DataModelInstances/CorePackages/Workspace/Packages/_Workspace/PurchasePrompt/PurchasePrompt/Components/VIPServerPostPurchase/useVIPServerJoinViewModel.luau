local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local ContextActionService = game:GetService("ContextActionService")
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local _ = require(script.Parent.VIPServerJoinView)
local _ = require(PurchasePrompt.types)
local config = {
	event_type = "show",
	component = "join_private_server_modal"
}
local config1 = {
	event_type = "click",
	component = "private_server_config",
	subcomponent = "join_now_btn"
}
local config2 = {
	event_type = "click",
	component = "private_server_config",
	subcomponent = "not_now_btn"
}

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), config (copy), config1 (copy), config2 (copy), ContextActionService (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		title = "Feature.PrivateServers.Label.YourPrivateServerIsReadyToJoin",
		join = "Common.VisitGame.Label.Play",
		somethingWentWrong = "CommonUI.Messages.Response.SomethingWentWrong"
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(false)
	local UseRefResult1 = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), config (upval)
		p1.logEvent(config)
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy)
		return function()
			-- upvalues: UseRefResult1 (upval)
			if UseRefResult1.current then
				UseRefResult1.current()
			end
		end
	end, {})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseStateResult2 (copy), UseStateResult2_1 (copy), p1 (copy), config1 (upval), UseRefResult1 (copy)
		if not UseRefResult.current then
			UseRefResult.current = true
			UseStateResult2(true)
			UseStateResult2_1(false)
			p1.logEvent(config1)
			UseRefResult1.current = p1.teleport(p1.vipServerAccessCode, function()
				-- upvalues: UseRefResult (upval), UseStateResult2 (upval), UseStateResult2_1 (upval)
				UseRefResult.current = false
				UseStateResult2(false)
				UseStateResult2_1(true)
			end)
			
			return
		end
	end, { p1.teleport, p1.vipServerAccessCode, p1.logEvent })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), config2 (upval)
		p1.logEvent(config2)
		p1.onClose()
	end, { p1.onClose, p1.logEvent })
	local UseRefResult2 = ReactModule.useRef(UseResult1)
	UseRefResult2.current = UseResult1
	ReactModule.useEffect(function()
		-- upvalues: ContextActionService (upval), UseRefResult2 (copy)
		ContextActionService:BindCoreAction("VIPServerJoinCloseButtonBind", function(_, UserInputState)
			-- upvalues: UseRefResult2 (upval)
			if UserInputState == Enum.UserInputState.Begin then
				UseRefResult2.current()
			end
		end, false, Enum.KeyCode.ButtonB)
		
		return function()
			-- upvalues: ContextActionService (upval)
			ContextActionService:UnbindCoreAction("VIPServerJoinCloseButtonBind")
		end
	end, {})
	
	return {
		locales = UseLocalizationResult,
		serverName = p1.serverName,
		gameName = p1.gameName,
		thumbnailUrl = p1.thumbnailUrl,
		hasError = UseStateResult1,
		isJoining = UseStateResult,
		onJoin = UseResult,
		onClose = UseResult1,
		focusRootRef = p1.focusRootRef,
		joinButtonRef = p1.joinButtonRef
	}
end