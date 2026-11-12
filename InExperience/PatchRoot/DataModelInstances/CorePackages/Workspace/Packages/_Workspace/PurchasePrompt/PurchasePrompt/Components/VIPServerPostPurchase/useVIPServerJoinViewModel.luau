local Parent = script:FindFirstAncestor("PurchasePrompt").Parent
local ContextActionService = game:GetService("ContextActionService")
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local _ = require(script.Parent.VIPServerJoinView)

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), ContextActionService (copy)
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
		-- upvalues: UseRefResult1 (copy)
		return function()
			-- upvalues: UseRefResult1 (upval)
			if UseRefResult1.current then
				UseRefResult1.current()
			end
		end
	end, {})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseStateResult2 (copy), UseStateResult2_1 (copy), UseRefResult1 (copy), p1 (copy)
		if not UseRefResult.current then
			UseRefResult.current = true
			UseStateResult2(true)
			UseStateResult2_1(false)
			UseRefResult1.current = p1.teleport(p1.vipServerAccessCode, function()
				-- upvalues: UseRefResult (upval), UseStateResult2 (upval), UseStateResult2_1 (upval)
				UseRefResult.current = false
				UseStateResult2(false)
				UseStateResult2_1(true)
			end)
			
			return
		end
	end, { p1.teleport, p1.vipServerAccessCode })
	local UseRefResult2 = ReactModule.useRef(p1.onClose)
	UseRefResult2.current = p1.onClose
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
		onClose = p1.onClose
	}
end