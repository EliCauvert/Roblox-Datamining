local DataSourcesModule = {
	array = function(Array)
		return { type = "array", array = Array }
	end,
	mutableSource = function(Methods)
		return { type = "mutableSource", methods = Methods }
	end,
	utilities = {}
}

function DataSourcesModule.utilities.createGetSimpleCursor(Callback1, Callback)
	return function(p1)
		-- upvalues: Callback (copy), Callback1 (copy)
		local CallbackResult = Callback()
		
		local function getWithCursor(p2: number)
			-- upvalues: CallbackResult (copy), getWithCursor (copy), Callback1 (upval)
			return if p2 < 1 or CallbackResult < p2 then nil else {
				before = function()
					-- upvalues: getWithCursor (upval), p2 (copy)
					return getWithCursor(p2 - 1)
				end,
				value = Callback1(p2),
				after = function()
					-- upvalues: getWithCursor (upval), p2 (copy)
					return getWithCursor(p2 + 1)
				end
			}
		end
		
		return (getWithCursor(p1))
	end
end

return DataSourcesModule