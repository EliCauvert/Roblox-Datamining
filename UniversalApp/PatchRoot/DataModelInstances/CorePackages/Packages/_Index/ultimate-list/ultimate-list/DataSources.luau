local DataSourcesModule = {
	array = function(Array) --[[ Line: 40 ]]
		return { type = "array", array = Array }
	end,
	mutableSource = function(Methods) --[[ Line: 47 ]]
		return { type = "mutableSource", methods = Methods }
	end,
	utilities = {}
}

function DataSourcesModule.utilities.createGetSimpleCursor(Callback1, Callback) --[[ Line: 58 ]]
	return function(p1) --[[ Line: 63 ]]
		-- upvalues: Callback (copy), Callback1 (copy)
		local CallbackResult = Callback()
		
		local function getWithCursor(p2: number) --[[ Line: 66 ]]
			-- upvalues: CallbackResult (copy), getWithCursor (copy), Callback1 (upval)
			return if p2 < 1 or CallbackResult < p2 then nil else {
				before = function() --[[ Line: 72 ]]
					-- upvalues: getWithCursor (upval), p2 (copy)
					return getWithCursor(p2 - 1)
				end,
				value = Callback1(p2),
				after = function() --[[ Line: 78 ]]
					-- upvalues: getWithCursor (upval), p2 (copy)
					return getWithCursor(p2 + 1)
				end
			}
		end
		
		return (getWithCursor(p1))
	end
end

return DataSourcesModule