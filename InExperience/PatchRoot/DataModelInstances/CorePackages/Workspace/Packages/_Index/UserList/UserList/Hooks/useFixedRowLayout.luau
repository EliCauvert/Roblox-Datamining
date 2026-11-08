local UserList = script:FindFirstAncestor("UserList")
local Parent = UserList.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ConstantsModule = require(UserList.Common.Constants)

return function(p1, p2)
	-- upvalues: FoundationModule (copy), ConstantsModule (copy), ReactModule (copy)
	local NewUSERROWHEIGHT = ConstantsModule.USER_ROW_HEIGHT + 2 * FoundationModule.Hooks.useTokens().Padding.Medium
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(Frame.AbsoluteSize.Y)
	end, {})
	local UseStateResult1 = if p2 then UseStateResult else 0
	
	return ReactModule.useMemo(function()
		-- upvalues: p1 (copy), NewUSERROWHEIGHT (copy), UseStateResult1 (copy), UseResult (copy)
		return if p1 then {
			itemSize = UDim2.new(1, 0, 0, NewUSERROWHEIGHT),
			getItemLayout = function(_, Index: number)
				-- upvalues: NewUSERROWHEIGHT (upval), UseStateResult1 (upval)
				return {
					length = NewUSERROWHEIGHT,
					offset = UseStateResult1 + NewUSERROWHEIGHT * (Index - 1),
					index = Index
				}
			end,
			onHeaderSizeChanged = UseResult
		} else nil
	end, { p1, NewUSERROWHEIGHT, UseStateResult1, UseResult })
end