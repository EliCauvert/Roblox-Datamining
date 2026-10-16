local Parent = script:FindFirstAncestor("ExpChat").Parent
local ReactModule = require(Parent.React)
local Dictionary = require(Parent.llama).Dictionary

local function _(p1) --[[ Line: 6 | Named "getConnect" ]]
	-- upvalues: Dictionary (copy), ReactModule (copy)
	return function(Callback) --[[ Line: 7 ]]
		-- upvalues: Dictionary (upval), ReactModule (upval), p1 (copy)
		local function transformedMapper(p2, Props) --[[ Line: 8 ]]
			-- upvalues: Dictionary (upval), Callback (copy)
			return Dictionary.map(Callback(Props), function(p3, _) --[[ Line: 9 ]]
				-- upvalues: p2 (copy)
				local Success, Result = pcall(function() --[[ Line: 10 ]]
					-- upvalues: p2 (upval), p3 (copy)
					return p2:TranslateGameText(game, p3)
				end)
				
				return if Success then Result else ""
			end)
		end
		
		return function(p2) --[[ Line: 22 ]]
			-- upvalues: ReactModule (upval), p1 (upval), Dictionary (upval), transformedMapper (copy)
			local ExtendResult = ReactModule.Component:extend("Connected-" .. tostring(p2))
			
			function ExtendResult.render(p3) --[[ Line: 25 ]]
				-- upvalues: ReactModule (upval), p1 (upval), p2 (copy), Dictionary (upval), transformedMapper (upval)
				return ReactModule.createElement(p1.Consumer, {
					render = function(p4) --[[ Line: 27 ]]
						-- upvalues: ReactModule (upval), p2 (upval), Dictionary (upval), p3 (copy), transformedMapper (upval)
						return ReactModule.createElement(p2, Dictionary.join(p3.props, transformedMapper(p4, p3.props)))
					end
				})
			end
			
			return ExtendResult
		end
	end
end

return function(p1) --[[ Line: 41 ]]
	-- upvalues: ReactModule (copy), Dictionary (copy)
	local Context = ReactModule.createContext(p1)
	
	return {
		Consumer = Context.Consumer,
		Provider = Context.Provider,
		connect = function(Callback) --[[ Line: 7 ]]
			-- upvalues: Dictionary (upval), ReactModule (upval), Context (copy)
			local function transformedMapper(p2, Props) --[[ Line: 8 ]]
				-- upvalues: Dictionary (upval), Callback (copy)
				return Dictionary.map(Callback(Props), function(p3, _) --[[ Line: 9 ]]
					-- upvalues: p2 (copy)
					local Success, Result = pcall(function() --[[ Line: 10 ]]
						-- upvalues: p2 (upval), p3 (copy)
						return p2:TranslateGameText(game, p3)
					end)
					
					return if Success then Result else ""
				end)
			end
			
			return function(p2) --[[ Line: 22 ]]
				-- upvalues: ReactModule (upval), Context (upval), Dictionary (upval), transformedMapper (copy)
				local ExtendResult = ReactModule.Component:extend("Connected-" .. tostring(p2))
				
				function ExtendResult.render(p3) --[[ Line: 25 ]]
					-- upvalues: ReactModule (upval), Context (upval), p2 (copy), Dictionary (upval), transformedMapper (upval)
					return ReactModule.createElement(Context.Consumer, {
						render = function(p4) --[[ Line: 27 ]]
							-- upvalues: ReactModule (upval), p2 (upval), Dictionary (upval), p3 (copy), transformedMapper (upval)
							return ReactModule.createElement(p2, Dictionary.join(p3.props, transformedMapper(p4, p3.props)))
						end
					})
				end
				
				return ExtendResult
			end
		end
	}
end