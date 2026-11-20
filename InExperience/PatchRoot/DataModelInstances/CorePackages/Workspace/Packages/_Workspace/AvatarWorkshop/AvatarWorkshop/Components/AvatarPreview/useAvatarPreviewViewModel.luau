local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local Parent = AvatarWorkshop.Parent
local ModelViewportModule = require(Parent.ModelViewport)
local ReactModule = require(Parent.React)
local _ = require(AvatarWorkshop.Stores.AvatarStateTypes)
local _ = require(AvatarWorkshop.PreBuildFilters.PreBuildFilterTypes)
local AvatarPreviewUtilsModule = require(script.Parent.AvatarPreviewUtils)
local _ = require(script.Parent.AvatarPreviewView)
local ApplyPreBuildFiltersModule = require(script.Parent.applyPreBuildFilters)
local CreateAvatarModelPoolModule = require(script.Parent.createAvatarModelPool)
local t = {}

local function _(p1, p2): boolean
	return p1 ~= nil and (p1.avatarState.humanoidDescription == p2.avatarState.humanoidDescription and p1.avatarState.rigType == p2.avatarState.rigType and p1.preBuildFilters == p2.preBuildFilters)
end

local function getFilteredState(p1)
	-- upvalues: ApplyPreBuildFiltersModule (copy)
	if not p1.isFiltered then
		local FilterWaiters = p1.filterWaiters
		
		if FilterWaiters then
			table.insert(FilterWaiters, coroutine.running())
			coroutine.yield()
		else
			local FilterWaiters1 = {}
			p1.filterWaiters = FilterWaiters1
			local Success, Result = pcall(ApplyPreBuildFiltersModule, p1.avatarState, p1.preBuildFilters)
			p1.isFiltered = true
			
			if Success then
				p1.filteredState = Result
			else
				p1.filterError = Result
			end
			p1.filterWaiters = nil
			
			for _, filterWaiter in FilterWaiters1 do
				task.spawn(filterWaiter)
			end
		end
	end
	if p1.filterError ~= nil then
		error(p1.filterError, 0)
	end
	return p1.filteredState
end

local Framing = {
	fieldOfViewDeg = require(script.Parent.AvatarPreviewConstants).FieldOfViewDeg
}
local Interaction = { rotation = ModelViewportModule.RotationMode.Yaw }

return function(Frame)
	-- upvalues: ReactModule (copy), ModelViewportModule (copy), Framing (copy), Interaction (copy), CreateAvatarModelPoolModule (copy), AvatarPreviewUtilsModule (copy), getFilteredState (copy), t (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseModelViewportResult = ModelViewportModule.useModelViewport({
		model = UseStateResult,
		framing = Framing,
		interaction = Interaction
	})
	local SceneRefs = UseModelViewportResult.sceneRefs
	local RefitFunction = UseModelViewportResult.refit
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(true)
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: CreateAvatarModelPoolModule (upval), AvatarPreviewUtilsModule (upval), UseStateResult2_1 (copy), getFilteredState (upval), SceneRefs (copy), RefitFunction (copy), UseStateResult2 (copy), UseRefResult (copy)
		local AvatarModelPoolModule = CreateAvatarModelPoolModule()
		local v1 = nil
		local Flag = false
		local v2 = nil
		local Flag1 = false
		local v3 = nil
		local v4 = nil
		local v5 = nil
		local v6 = nil
		
		local function _(p2, p3)
			-- upvalues: AvatarPreviewUtilsModule (upval), UseStateResult2_1 (upval)
			if p2 == nil or (p2.rigType ~= p3.rigType or AvatarPreviewUtilsModule.needsClusterComposition(p3, p2.humanoidDescription)) then
				UseStateResult2_1(true)
			end
		end
		
		local function showSpinner()
			-- upvalues: UseStateResult2_1 (upval)
			UseStateResult2_1(true)
		end
		
		local function runBuilds()
			-- upvalues: Flag (ref), v1 (ref), Flag1 (ref), v6 (ref), getFilteredState (upval), v2 (ref), AvatarPreviewUtilsModule (upval), UseStateResult2_1 (upval), SceneRefs (upval), AvatarModelPoolModule (copy), showSpinner (copy), v3 (ref), RefitFunction (upval), UseStateResult2 (upval), v4 (ref), v5 (ref)
			Flag = true
			while v1 and not Flag1 do
				local v7 = v1
				v1 = nil
				v6 = nil
				local v8 = nil
				local Success, Result = pcall(function()
					-- upvalues: getFilteredState (upval), v7 (copy), Flag1 (upval), v8 (ref), v6 (upval), v2 (upval), AvatarPreviewUtilsModule (upval), UseStateResult2_1 (upval), SceneRefs (upval), AvatarModelPoolModule (upval), showSpinner (upval)
					local FilteredState = getFilteredState(v7)
					
					if Flag1 then
						return nil
					end
					v8 = FilteredState
					v6 = FilteredState
					local v9 = v2
					
					if v9 == nil or (v9.rigType ~= FilteredState.rigType or AvatarPreviewUtilsModule.needsClusterComposition(FilteredState, v9.humanoidDescription)) then
						UseStateResult2_1(true)
					end
					local Current = SceneRefs.worldModel.current
					
					return if Current then AvatarModelPoolModule.build(FilteredState, Current, showSpinner) else nil
				end)
				
				if Flag1 then break end
				local Result1 = if Success then Result else nil
				
				if Result1 then
					if Result1 == v3 then
						RefitFunction()
					else
						v3 = Result1
						UseStateResult2(Result1)
					end
					local Success1, Result2 = pcall(AvatarPreviewUtilsModule.playIdleAnimation, Result1)
					
					if not Success1 then
						warn("AvatarPreview failed to play the idle animation:", Result2)
					end
					v2 = v8
					v4 = v7
				else
					if not v1 then
						v5 = v4
					end
					if not Success then
						warn("AvatarPreview failed to build the avatar:", Result)
					end
				end
				if not v1 then
					UseStateResult2_1(false)
				end
			end
			v6 = nil
			Flag = false
		end
		
		UseRefResult.current = {
			schedule = function(p2)
				-- upvalues: v5 (ref), v1 (ref), Flag (ref), getFilteredState (upval), Flag1 (ref), v6 (ref), v2 (ref), AvatarPreviewUtilsModule (upval), UseStateResult2_1 (upval), runBuilds (copy)
				local v9 = v5
				
				if v9 ~= nil and (v9.avatarState.humanoidDescription == p2.avatarState.humanoidDescription and (v9.avatarState.rigType == p2.avatarState.rigType and v9.preBuildFilters == p2.preBuildFilters)) then return end
				v5 = p2
				v1 = p2
				
				if Flag then
					task.spawn(function()
						-- upvalues: getFilteredState (upval), p2 (copy), Flag1 (upval), v1 (upval), v6 (upval), v2 (upval), AvatarPreviewUtilsModule (upval), UseStateResult2_1 (upval)
						local Success, Result = pcall(getFilteredState, p2)
						
						if not Success or Flag1 or v1 ~= p2 then return end
						local V35 = v6 or v2
						
						if V35 == nil or (V35.rigType ~= Result.rigType or AvatarPreviewUtilsModule.needsClusterComposition(Result, V35.humanoidDescription)) then
							UseStateResult2_1(true)
						end
					end)
					
					return
				else
					task.spawn(runBuilds)
				end
			end
		}
		
		return function()
			-- upvalues: Flag1 (ref), UseRefResult (upval), AvatarModelPoolModule (copy)
			Flag1 = true
			UseRefResult.current = nil
			AvatarModelPoolModule.destroy()
		end
	end, { RefitFunction, SceneRefs.worldModel })
	ReactModule.useEffect(function()
		-- upvalues: SceneRefs (copy), AvatarPreviewUtilsModule (upval)
		local Current = SceneRefs.viewportFrame.current
		
		if Current then
			local DisableChromeWindowDragResult = nil
			local MouseEnterConnection = Current.MouseEnter:Connect(function()
				-- upvalues: DisableChromeWindowDragResult (ref), AvatarPreviewUtilsModule (upval), Current (copy)
				if DisableChromeWindowDragResult then
					DisableChromeWindowDragResult.Interactable = true
					DisableChromeWindowDragResult = nil
				end
				DisableChromeWindowDragResult = AvatarPreviewUtilsModule.disableChromeWindowDrag(Current)
			end)
			local MouseLeaveConnection = Current.MouseLeave:Connect(function()
				-- upvalues: DisableChromeWindowDragResult (ref)
				if DisableChromeWindowDragResult then
					DisableChromeWindowDragResult.Interactable = true
					DisableChromeWindowDragResult = nil
				end
			end)
			
			return function()
				-- upvalues: MouseEnterConnection (copy), MouseLeaveConnection (copy), DisableChromeWindowDragResult (ref)
				MouseEnterConnection:Disconnect()
				MouseLeaveConnection:Disconnect()
				
				if DisableChromeWindowDragResult then
					DisableChromeWindowDragResult.Interactable = true
					DisableChromeWindowDragResult = nil
				end
			end
		else
			return nil
		end
	end, { SceneRefs.viewportFrame })
	local PreBuildFilters = Frame.preBuildFilters or t
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), Frame (copy), PreBuildFilters (copy)
		local Current = UseRefResult.current
		
		if Current then
			Current.schedule({
				avatarState = Frame.avatarState,
				preBuildFilters = PreBuildFilters
			})
		end
	end, { Frame.avatarState, PreBuildFilters })
	
	return {
		sceneRefs = SceneRefs,
		inputHandlers = UseModelViewportResult.inputHandlers,
		isLoading = UseStateResult1,
		LayoutOrder = Frame.LayoutOrder
	}
end