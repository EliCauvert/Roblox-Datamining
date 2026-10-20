local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ContextActionService = game:GetService("ContextActionService")
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(Parent1.React)
local SignalsReactModule = require(Parent1.SignalsReact)
local _ = require(Parent1.LeaderboardStore)
local ScrollView = require(Parent1.Foundation).ScrollView
local PlayerListVisibilityStoreModule = require(Parent.Common.PlayerListVisibilityStore)
local PlayerContextualMenuStoreModule = require(Parent.Common.PlayerContextualMenuStore)
local TeamListViewModule = require(Parent.Components.Presentation.TeamListView)
local UseGamepadStickScrollModule = require(Parent.Hooks.useGamepadStickScroll)

local function _(): boolean
	-- upvalues: UserInputService (copy)
	return UserInputService:GetLastInputType().Name:find("Gamepad") ~= nil
end

return function(p1)
	-- upvalues: ReactModule (copy), SignalsReactModule (copy), PlayerListVisibilityStoreModule (copy), PlayerContextualMenuStoreModule (copy), UserInputService (copy), UseGamepadStickScrollModule (copy), GuiService (copy), ContextActionService (copy), TeamListViewModule (copy), ScrollView (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseSignalStateResult = SignalsReactModule.useSignalState(PlayerListVisibilityStoreModule.getEffectiveVisible)
	local HasUseSignalStateResult = SignalsReactModule.useSignalState(PlayerContextualMenuStoreModule.getMenuData) ~= nil
	local NoHasUseSignalStateResult: boolean = UseSignalStateResult and not HasUseSignalStateResult
	local AllTeams = p1.allTeams
	local HasGamepad = if p1.isGamepadOverride == nil then UserInputService:GetLastInputType().Name:find("Gamepad") ~= nil else p1.isGamepadOverride
	UseGamepadStickScrollModule({
		scrollingFrameRef = UseRefResult1,
		enabled = NoHasUseSignalStateResult
	})
	local UseRefResult2 = ReactModule.useRef(Enum.OverrideMouseIconBehavior.None)
	local UseRefResult3 = ReactModule.useRef(nil)
	local UseRefResult4 = ReactModule.useRef(false)
	local UseRefResult5 = ReactModule.useRef(false)
	
	local function _()
		-- upvalues: UseRefResult5 (copy), UserInputService (upval), UseRefResult2 (copy), GuiService (upval), UseRefResult1 (copy), UseRefResult3 (copy), UseRefResult4 (copy)
		if not UseRefResult5.current then return end
		UserInputService.OverrideMouseIconBehavior = UseRefResult2.current
		UseRefResult2.current = Enum.OverrideMouseIconBehavior.None
		local SelectedCoreObject = GuiService.SelectedCoreObject
		
		if SelectedCoreObject and UseRefResult1.current and SelectedCoreObject:IsDescendantOf(UseRefResult1.current) then
			GuiService.SelectedCoreObject = UseRefResult3.current
		end
		UseRefResult3.current = nil
		UseRefResult5.current = false
		UseRefResult4.current = false
	end
	
	local _ = function()
		-- upvalues: GuiService (upval), UseRefResult1 (copy), UseRefResult4 (copy)
		local SelectedCoreObject = GuiService.SelectedCoreObject
		
		if SelectedCoreObject and UseRefResult1.current and SelectedCoreObject:IsDescendantOf(UseRefResult1.current) then
			GuiService.SelectedCoreObject = nil
		end
		UseRefResult4.current = false
	end
	
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult (copy), UseRefResult5 (copy), UserInputService (upval), UseRefResult2 (copy), GuiService (upval), UseRefResult1 (copy), UseRefResult3 (copy), UseRefResult4 (copy), HasUseSignalStateResult (copy), HasGamepad (copy), UseRefResult (copy), PlayerListVisibilityStoreModule (upval), PlayerContextualMenuStoreModule (upval)
		if UseSignalStateResult then
			if HasUseSignalStateResult then
				local SelectedCoreObject = GuiService.SelectedCoreObject
				
				if SelectedCoreObject and UseRefResult1.current and SelectedCoreObject:IsDescendantOf(UseRefResult1.current) then
					GuiService.SelectedCoreObject = nil
				end
				UseRefResult4.current = false
				
				return function() end
			else
				if not UseRefResult4.current and HasGamepad and UseRefResult.current then
					if not UseRefResult5.current then
						UseRefResult3.current = GuiService.SelectedCoreObject
						UseRefResult2.current = UserInputService.OverrideMouseIconBehavior
						UseRefResult5.current = true
					end
					GuiService.SelectedCoreObject = UseRefResult.current
					UserInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide
					UseRefResult4.current = true
				end
				return function()
					-- upvalues: PlayerListVisibilityStoreModule (upval), UseRefResult5 (upval), UserInputService (upval), UseRefResult2 (upval), GuiService (upval), UseRefResult1 (upval), UseRefResult3 (upval), UseRefResult4 (upval), PlayerContextualMenuStoreModule (upval)
					if PlayerListVisibilityStoreModule.getEffectiveVisible(false) then
						if PlayerContextualMenuStoreModule.getMenuData(false) ~= nil then
							local SelectedCoreObject = GuiService.SelectedCoreObject
							
							if SelectedCoreObject and UseRefResult1.current and SelectedCoreObject:IsDescendantOf(UseRefResult1.current) then
								GuiService.SelectedCoreObject = nil
							end
							UseRefResult4.current = false
						end
						return
					else
						if not UseRefResult5.current then return end
						UserInputService.OverrideMouseIconBehavior = UseRefResult2.current
						UseRefResult2.current = Enum.OverrideMouseIconBehavior.None
						local SelectedCoreObject = GuiService.SelectedCoreObject
						
						if SelectedCoreObject and UseRefResult1.current and SelectedCoreObject:IsDescendantOf(UseRefResult1.current) then
							GuiService.SelectedCoreObject = UseRefResult3.current
						end
						UseRefResult3.current = nil
						UseRefResult5.current = false
						UseRefResult4.current = false
					end
				end
			end
		else
			if UseRefResult5.current then
				UserInputService.OverrideMouseIconBehavior = UseRefResult2.current
				UseRefResult2.current = Enum.OverrideMouseIconBehavior.None
				local SelectedCoreObject = GuiService.SelectedCoreObject
				
				if SelectedCoreObject and UseRefResult1.current and SelectedCoreObject:IsDescendantOf(UseRefResult1.current) then
					GuiService.SelectedCoreObject = UseRefResult3.current
				end
				UseRefResult3.current = nil
				UseRefResult5.current = false
				UseRefResult4.current = false
			end
			return function() end
		end
	end, {
		UseSignalStateResult,
		HasUseSignalStateResult,
		HasGamepad
	})
	ReactModule.useEffect(function()
		-- upvalues: NoHasUseSignalStateResult (copy), HasGamepad (copy), UseRefResult (copy), UseRefResult4 (copy), UseRefResult5 (copy), UseRefResult3 (copy), GuiService (upval), UseRefResult2 (copy), UserInputService (upval)
		if not NoHasUseSignalStateResult or not HasGamepad or not UseRefResult.current then return end
		if UseRefResult4.current then
			GuiService.SelectedCoreObject = UseRefResult.current
			
			return
		end
		if not UseRefResult5.current then
			UseRefResult3.current = GuiService.SelectedCoreObject
			UseRefResult2.current = UserInputService.OverrideMouseIconBehavior
			UseRefResult5.current = true
		end
		GuiService.SelectedCoreObject = UseRefResult.current
		UserInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide
		UseRefResult4.current = true
	end, { NoHasUseSignalStateResult, AllTeams, HasGamepad })
	ReactModule.useEffect(function()
		-- upvalues: NoHasUseSignalStateResult (copy), ContextActionService (upval), PlayerContextualMenuStoreModule (upval), PlayerListVisibilityStoreModule (upval)
		if NoHasUseSignalStateResult then
			ContextActionService:BindCoreAction("RbxPlayerListReskinGamepadClose", function(_, UserInputState, _)
				-- upvalues: PlayerContextualMenuStoreModule (upval), PlayerListVisibilityStoreModule (upval)
				if UserInputState == Enum.UserInputState.Begin then
					PlayerContextualMenuStoreModule.closeContextMenu()
					PlayerListVisibilityStoreModule.setVisible(false)
					
					return Enum.ContextActionResult.Sink
				else
					return Enum.ContextActionResult.Pass
				end
			end, false, Enum.KeyCode.ButtonB)
			
			return function()
				-- upvalues: ContextActionService (upval)
				ContextActionService:UnbindCoreAction("RbxPlayerListReskinGamepadClose")
			end
		else
			return function() end
		end
	end, { NoHasUseSignalStateResult })
	local LeaderboardStore = p1.leaderboardStore
	local StatColumns = p1.statColumns
	local StatWidth = p1.statWidth
	local RowHeight = p1.rowHeight
	local ColumnHeaderHeight = p1.columnHeaderHeight
	local HasNonNeutralTeams = p1.hasNonNeutralTeams
	local LocalPlayer = p1.localPlayer
	local OnActivated = p1.onActivated
	local List = {}
	
	for i, allTeam in pairs(AllTeams) do
		if allTeam then
			table.insert(List, i)
		end
	end
	table.sort(List, function(A, B): boolean
		-- upvalues: AllTeams (copy)
		if A == "Neutral" and B ~= "Neutral" then
			return false
		elseif B == "Neutral" and A ~= "Neutral" then
			return true
		else
			local AllTeam = AllTeams[A]
			local AllTeam1 = AllTeams[B]
			local OrderResult = if AllTeam and AllTeam.order then AllTeam.order(false) else 0
			local OrderResult1 = if AllTeam1 and AllTeam1.order then AllTeam1.order(false) else 0
			
			return if OrderResult == OrderResult1 then tostring(A) < tostring(B) else OrderResult < OrderResult1
		end
	end)
	local Flag = false
	local Elements = {}
	
	for _, value in ipairs(List) do
		local AllTeam = AllTeams[value]
		local HasNextEntry: boolean = AllTeam and (AllTeam.players and next(AllTeam.players.getAllData(false)) ~= nil)
		local FirstRowRefForward = nil
		
		if not Flag and HasNextEntry then
			FirstRowRefForward = UseRefResult
			Flag = true
		end
		Elements[`Team_{tostring(value)}`] = ReactModule.createElement(TeamListViewModule, {
			teamEntry = AllTeam,
			isNeutral = value == "Neutral",
			hasNonNeutralTeams = HasNonNeutralTeams,
			leaderboardStore = LeaderboardStore,
			statColumns = StatColumns,
			statWidth = StatWidth,
			rowHeight = RowHeight,
			columnHeaderHeight = ColumnHeaderHeight,
			onActivated = OnActivated,
			localPlayer = LocalPlayer,
			firstRowRefForward = FirstRowRefForward
		})
	end
	local Copy = table.clone(p1.scrollViewProps)
	Copy.ref = UseRefResult1
	
	return ReactModule.createElement(ScrollView, Copy, Elements)
end