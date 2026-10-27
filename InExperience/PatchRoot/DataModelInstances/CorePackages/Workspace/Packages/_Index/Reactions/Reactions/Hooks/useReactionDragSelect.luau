local Reactions = script:FindFirstAncestor("Reactions")
local ReactModule = require(Reactions.Parent.React)
local _ = require(Reactions.Enums.ReactionType)
local PlayReactionHoverHapticModule = require(Reactions.Utils.playReactionHoverHaptic)
local ToGuiSpaceModule = require(Reactions.Utils.toGuiSpace)

local function _(Frame: Frame, Vector): boolean
	local AbsolutePosition = Frame.AbsolutePosition
	local NewAbsolutePosition = AbsolutePosition + Frame.AbsoluteSize
	
	return AbsolutePosition.X <= Vector.X and (Vector.X <= NewAbsolutePosition.X and AbsolutePosition.Y <= Vector.Y) and Vector.Y <= NewAbsolutePosition.Y
end

local function findReactionAt(Current, p1)
	-- upvalues: ToGuiSpaceModule (copy)
	for i, Frame in Current do
		local GuiSpaceModule = ToGuiSpaceModule(p1, Frame)
		local AbsolutePosition = Frame.AbsolutePosition
		local NewAbsolutePosition = AbsolutePosition + Frame.AbsoluteSize
		
		if AbsolutePosition.X <= GuiSpaceModule.X and (GuiSpaceModule.X <= NewAbsolutePosition.X and (AbsolutePosition.Y <= GuiSpaceModule.Y and GuiSpaceModule.Y <= NewAbsolutePosition.Y)) then
			return i, Frame
		end
	end
	return nil, nil
end

return function(Current)
	-- upvalues: ReactModule (copy), PlayReactionHoverHapticModule (copy), findReactionAt (copy)
	local UseRefResult = ReactModule.useRef(Current)
	UseRefResult.current = Current
	local UseRefResult1 = ReactModule.useRef({})
	local UseRefResult2 = ReactModule.useRef({})
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRefResult3 = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult3 (copy), UseStateResult2 (copy), PlayReactionHoverHapticModule (upval)
		if UseRefResult3.current == Current then return end
		UseRefResult3.current = Current
		UseStateResult2(Current)
		
		if Current ~= nil then
			PlayReactionHoverHapticModule()
		end
	end, {})
	
	return {
		hoveredReaction = UseStateResult,
		getButtonRef = ReactModule.useCallback(function(Key)
			-- upvalues: UseRefResult2 (copy), UseRefResult1 (copy)
			local Current = UseRefResult2.current
			local CurrentEntry: (any) -> () = Current[Key]
			
			if CurrentEntry == nil then
				CurrentEntry = function(p2)
					-- upvalues: UseRefResult1 (upval), Key (copy)
					UseRefResult1.current[Key] = p2
				end
				
				Current[Key] = CurrentEntry
			end
			return CurrentEntry
		end, {}),
		onDragMoved = ReactModule.useCallback(function(p2)
			-- upvalues: findReactionAt (upval), UseRefResult1 (copy), UseResult (copy)
			UseResult((findReactionAt(UseRefResult1.current, p2)))
		end, { UseResult }),
		onDragEnded = ReactModule.useCallback(function(p2)
			-- upvalues: UseResult (copy), findReactionAt (upval), UseRefResult1 (copy), UseRefResult (copy)
			UseResult(nil)
			
			if p2 == nil then return end
			local ReactionAt, ReactionAt2 = findReactionAt(UseRefResult1.current, p2)
			
			if ReactionAt ~= nil and ReactionAt2 ~= nil then
				UseRefResult.current(ReactionAt, ReactionAt2.AbsolutePosition + ReactionAt2.AbsoluteSize / 2)
			end
		end, { UseResult })
	}
end