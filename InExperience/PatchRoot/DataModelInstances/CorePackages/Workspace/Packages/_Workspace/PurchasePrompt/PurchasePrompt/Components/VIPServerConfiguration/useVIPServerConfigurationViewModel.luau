local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local ContextActionService = game:GetService("ContextActionService")
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local Default = require(Parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local _ = require(script.Parent.VIPServerConfigurationView)
local _ = require(PurchasePrompt.types)

local function _(p1)
	return (p1:match("^%s*(.-)%s*$"))
end

local function getOtherPlayers(Players)
	local List = {}
	
	for _, player in Players:GetPlayers() do
		if player ~= Players.LocalPlayer then
			table.insert(List, player)
		end
	end
	return List
end

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), getOtherPlayers (copy), Default (copy), ContextActionService (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		title = "Feature.PrivateServers.Heading.ConfigurePrivateServer",
		serverName = "Feature.PrivateServers.Label.ServerName",
		whoCanJoin = "Feature.PrivateServers.Label.WhoCanJoin",
		searchPeople = "Feature.PrivateServers.Label.SearchPeople",
		inThisServer = "Feature.PrivateServers.Label.InThisServer",
		noOne = "Feature.AccountSettings.Label.DropDown.NoOne",
		add = "CommonUI.Features.Label.Add",
		friendsAllowed = "Feature.PrivateServers.Label.FriendsAllowed",
		friendsAllowedDescription = "Feature.PrivateServers.Description.FriendsAllowed",
		privateServerLink = "Feature.PrivateServers.Label.PrivateServerLink",
		anyoneWithThisLinkCanJoin = "Feature.PrivateServers.Label.AnyoneWithThisLinkCanJoin",
		generate = "Feature.PrivateServers.Action.Generate",
		generateLinkPlaceholder = "Feature.PrivateServers.Label.PrivateServerGenerateLinkPlaceholder",
		somethingWentWrong = "CommonUI.Messages.Response.SomethingWentWrong",
		cancel = "CommonUI.Controls.Action.Cancel",
		["continue"] = "CommonUI.Controls.Action.Continue"
	})
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(p1.defaultServerName)
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState({})
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState({})
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(nil)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding("")
	local UseStateResult6, UseStateResult2_5 = ReactModule.useState(false)
	local UseStateResult7, UseStateResult2_6 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult8, UseStateResult2_7 = ReactModule.useState(false)
	local UseStateResult9, UseStateResult2_8 = ReactModule.useState(false)
	local UseStateResult10, UseStateResult2_9 = ReactModule.useState(function()
		-- upvalues: getOtherPlayers (upval), p1 (copy)
		return (getOtherPlayers(p1.players))
	end)
	local UseRefResult1 = ReactModule.useRef(false)
	local UseRefResult2 = ReactModule.useRef(false)
	local UseRefResult3 = ReactModule.useRef(true)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult3 (copy), UseRefResult (copy)
		UseRefResult3.current = true
		
		return function()
			-- upvalues: UseRefResult3 (upval), UseRefResult (upval)
			UseRefResult3.current = false
			
			if UseRefResult.current then
				task.cancel(UseRefResult.current)
			end
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseStateResult2_9 (copy)
		local PlayerAddedConnection = p1.players.PlayerAdded:Connect(function(Value)
			-- upvalues: UseStateResult2_9 (upval)
			UseStateResult2_9(function(List)
				-- upvalues: Value (copy)
				if table.find(List, Value) then
					return List
				else
					local Copy = table.clone(List)
					table.insert(Copy, Value)
					
					return Copy
				end
			end)
		end)
		local PlayerRemovingConnection = p1.players.PlayerRemoving:Connect(function(Player)
			-- upvalues: UseStateResult2_9 (upval)
			UseStateResult2_9(function(List)
				-- upvalues: Player (copy)
				local List1 = {}
				
				for _, value in List do
					if value ~= Player then
						table.insert(List1, value)
					end
				end
				return List1
			end)
		end)
		
		return function()
			-- upvalues: PlayerAddedConnection (copy), PlayerRemovingConnection (copy)
			PlayerAddedConnection:Disconnect()
			PlayerRemovingConnection:Disconnect()
		end
	end, { p1.players })
	local SS = UseStateResult:match("^%s*(.-)%s*$")
	local v1 = (utf8.len(SS) or 0) >= 3
	ReactModule.useEffect(function()
		-- upvalues: v1 (copy), UseStateResult2_3 (copy), p1 (copy), SS (copy)
		if v1 then
			local Flag = true
			local DelayedThread = task.delay(0.3, function()
				-- upvalues: p1 (upval), SS (upval), Flag (ref), UseStateResult2_3 (upval)
				p1.searchUsers(SS):andThen(function(Result)
					-- upvalues: Flag (upval), UseStateResult2_3 (upval)
					if Flag then
						UseStateResult2_3(Result)
					end
				end):catch(function()
					-- upvalues: Flag (upval), UseStateResult2_3 (upval)
					if Flag then
						UseStateResult2_3({})
					end
				end)
			end)
			
			return function()
				-- upvalues: Flag (ref), DelayedThread (copy)
				Flag = false
				task.cancel(DelayedThread)
			end
		else
			UseStateResult2_3({})
			
			return nil
		end
	end, { SS, v1, p1.searchUsers })
	local UseResult = ReactModule.useCallback(function(p2, p3)
		-- upvalues: UseStateResult2_2 (copy)
		UseStateResult2_2(function(Tbl)
			-- upvalues: p3 (copy), p2 (copy)
			local Copy = table.clone(Tbl)
			
			if p3 then
				Copy[p2] = p3
				
				return Copy
			else
				Copy[p2] = nil
				
				return Copy
			end
		end)
	end, {})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseStateResult10 (copy), UseStateResult3 (copy), UseResult (copy)
		local List = {}
		
		for _, Player in UseStateResult10 do
			local UserId = Player.UserId
			local DisplayName = Player.DisplayName
			local HasUseStateResultEntry = UseStateResult3[UserId] ~= nil
			table.insert(List, {
				userId = UserId,
				displayName = DisplayName,
				isAdded = HasUseStateResultEntry,
				onToggleAdded = function()
					-- upvalues: UseResult (upval), UserId (copy), HasUseStateResultEntry (copy), DisplayName (copy)
					UseResult(UserId, if HasUseStateResultEntry then nil else DisplayName)
				end
			})
		end
		return List
	end, { UseStateResult10, UseStateResult3, UseResult })
	local UserId = p1.players.LocalPlayer.UserId
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: v1 (copy), UseStateResult4 (copy), UserId (copy), UseStateResult3 (copy), UseResult (copy), UseStateResult2 (copy)
		local List = {}
		
		if not v1 then
			return List
		end
		for _, value in UseStateResult4 do
			if value.userId ~= UserId and UseStateResult3[value.userId] == nil then
				table.insert(List, {
					userId = value.userId,
					displayName = value.displayName,
					onSelected = function()
						-- upvalues: UseResult (upval), value (copy), UseStateResult2 (upval)
						UseResult(value.userId, value.displayName)
						UseStateResult2("")
					end
				})
			end
		end
		return List
	end, {
		v1,
		UseStateResult4,
		UseStateResult3,
		UserId,
		UseResult
	})
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: UseStateResult3 (copy), UseResult (copy)
		local List = {}
		
		for UserId, DisplayName in UseStateResult3 do
			table.insert(List, {
				userId = UserId,
				displayName = DisplayName,
				onRemove = function()
					-- upvalues: UseResult (upval), UserId (copy)
					UseResult(UserId, nil)
				end
			})
		end
		table.sort(List, function(A, B): boolean
			return A.displayName < B.displayName
		end)
		
		return List
	end, { UseStateResult3, UseResult })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult1 (copy), UseStateResult2_5 (copy), UseStateResult2_8 (copy), p1 (copy), UseRefResult3 (copy), UseStateResult2_4 (copy), UseBindingResult2_1 (copy)
		if not UseRefResult1.current then
			UseRefResult1.current = true
			UseStateResult2_5(true)
			UseStateResult2_8(false)
			p1.generateLink():andThen(function(Result)
				-- upvalues: UseRefResult3 (upval), UseStateResult2_4 (upval), UseBindingResult2_1 (upval), UseStateResult2_5 (upval)
				if UseRefResult3.current then
					UseStateResult2_4(Result)
					UseBindingResult2_1(Result)
					UseStateResult2_5(false)
				end
			end):catch(function()
				-- upvalues: UseRefResult1 (upval), UseRefResult3 (upval), UseStateResult2_5 (upval), UseStateResult2_8 (upval)
				UseRefResult1.current = false
				
				if UseRefResult3.current then
					UseStateResult2_5(false)
					UseStateResult2_8(true)
				end
			end)
			
			return
		end
	end, { p1.generateLink, UseBindingResult2_1 })
	local UseResult2 = ReactModule.useCallback(function(Link)
		-- upvalues: UseStateResult5 (copy), UseBindingResult2_1 (copy)
		if UseStateResult5 ~= nil and Link ~= UseStateResult5 then
			UseBindingResult2_1(UseStateResult5)
		end
	end, { UseStateResult5, UseBindingResult2_1 })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult5 (copy), Default (upval), UseStateResult2_6 (copy), UseRefResult (copy)
		if UseStateResult5 == nil then return end
		Default:setClipboardText({
			context = "PurchasePromptVIPServerLink",
			text = UseStateResult5
		})
		UseStateResult2_6(true)
		
		if UseRefResult.current then
			task.cancel(UseRefResult.current)
		end
		UseRefResult.current = task.delay(2, function()
			-- upvalues: UseRefResult (upval), UseStateResult2_6 (upval)
			UseRefResult.current = nil
			UseStateResult2_6(false)
		end)
	end, { UseStateResult5 })
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult2 (copy), UseStateResult2_7 (copy), UseStateResult2_8 (copy), UseBindingResult (copy), UseStateResult3 (copy), p1 (copy), UseStateResult1 (copy), UseRefResult3 (copy)
		if UseRefResult2.current then return end
		UseRefResult2.current = true
		UseStateResult2_7(true)
		UseStateResult2_8(false)
		local SS = UseBindingResult:getValue():match("^%s*(.-)%s*$")
		local UsersToAdd = {}
		
		for i in UseStateResult3 do
			table.insert(UsersToAdd, i)
		end
		p1.save({
			name = if SS == "" or SS == p1.defaultServerName then nil else SS,
			friendsAllowed = UseStateResult1,
			usersToAdd = UsersToAdd
		}):andThen(function()
			-- upvalues: UseRefResult3 (upval), p1 (upval)
			if UseRefResult3.current then
				p1.onClose()
			end
		end):catch(function()
			-- upvalues: UseRefResult2 (upval), UseRefResult3 (upval), UseStateResult2_7 (upval), UseStateResult2_8 (upval)
			UseRefResult2.current = false
			
			if UseRefResult3.current then
				UseStateResult2_7(false)
				UseStateResult2_8(true)
			end
		end)
	end, {
		UseBindingResult, UseStateResult3, UseStateResult1, p1.save, p1.onClose,
		p1.defaultServerName
	})
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult2 (copy), p1 (copy)
		if not UseRefResult2.current then
			p1.onClose()
		end
	end, { p1.onClose })
	local UseRefResult4 = ReactModule.useRef(UseResult5)
	UseRefResult4.current = UseResult5
	ReactModule.useEffect(function()
		-- upvalues: ContextActionService (upval), UseRefResult4 (copy)
		ContextActionService:BindCoreAction("VIPServerConfigurationCancelButtonBind", function(_, UserInputState)
			-- upvalues: UseRefResult4 (upval)
			if UserInputState == Enum.UserInputState.Begin then
				UseRefResult4.current()
			end
		end, false, Enum.KeyCode.ButtonB)
		
		return function()
			-- upvalues: ContextActionService (upval)
			ContextActionService:UnbindCoreAction("VIPServerConfigurationCancelButtonBind")
		end
	end, {})
	
	return {
		locales = UseLocalizationResult,
		serverName = UseBindingResult,
		onServerNameChanged = UseBindingResult2,
		searchText = UseStateResult,
		onSearchTextChanged = UseStateResult2,
		searchResults = UseMemoResult1,
		players = UseMemoResult,
		addedPlayers = UseMemoResult2,
		friendsAllowed = UseStateResult1,
		onFriendsAllowedChanged = UseStateResult2_1,
		link = UseStateResult5,
		linkText = UseBindingResult1,
		onLinkTextChanged = UseResult2,
		isGeneratingLink = UseStateResult6,
		onGenerateLink = UseResult1,
		onCopyLink = UseResult3,
		isLinkCopied = UseStateResult7,
		hasError = UseStateResult9,
		isSaving = UseStateResult8,
		onSave = UseResult4,
		onCancel = UseResult5
	}
end