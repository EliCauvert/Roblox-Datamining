local Parent = script.Parent.Parent
local MagicMockModule = require(Parent.MagicMock)
local SpyModule = require(Parent.Spy)
local GetCallsModule = require(Parent.getCalls)

return function(p1, Count: number) --[[ Line: 6 ]]
	-- upvalues: MagicMockModule (copy), SpyModule (copy), GetCallsModule (copy)
	if not MagicMockModule.is(p1) and not SpyModule.is(p1) then
		return {
			pass = false,
			message = string.format("expect(mock) must be a MagicMock or Spy when .toHaveBeenCalled is used. Given %s instead", (tostring(p1)))
		}
	end
	local Count1 = #GetCallsModule(p1)
	local Formatted = nil
	local IsCountAbove = nil
	
	if Count then
		if type(Count) ~= "number" or (Count <= 0 or Count % 1 ~= 0) then
			return {
				pass = false,
				message = string.format("expectedTimesCalled must be a positive integer. Given %s instead.", (tostring(Count)))
			}
		end
		IsCountAbove = Count == Count1
		Formatted = IsCountAbove and string.format("Expected %s to not have been called exactly %d times.", tostring(p1), Count) or string.format("Expected %s to have been called %d times. Was called %d times instead.", tostring(p1), Count, Count1)
	else
		IsCountAbove = Count1 > 0
		Formatted = IsCountAbove and string.format("Expected %s to never have been called. Was called %d times instead.", tostring(p1), Count1) or string.format("Expected %s to have been called at least once.", (tostring(p1)))
	end
	return { pass = IsCountAbove, message = Formatted }
end