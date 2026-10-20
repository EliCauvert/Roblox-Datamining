local Parent = script:FindFirstAncestor("ExpChat").Parent
local ReactModule = require(Parent.React)
local Dictionary = require(Parent.llama).Dictionary

local function _(p1)
	-- upvalues: Dictionary (copy), ReactModule (copy)
	return function(Callback)
		-- upvalues: Dictionary (upval), ReactModule (upval), p1 (copy)
		local function transformedMapper(p2, Props)
			-- upvalues: Dictionary (upval), Callback (copy)
			return Dictionary.map(Callback(Props), function(p3, _)
				-- upvalues: p2 (copy)
				local Success, Result = pcall(function()
					-- upvalues: p2 (upval), p3 (copy)
					return p2:TranslateGameText(game, p3)
				end)
				
				return if Success then Result else ""
			end)
		end
		
		return function(p2)
			-- upvalues: ReactModule (upval), p1 (upval), Dictionary (upval), transformedMapper (copy)
			local ExtendResult = ReactModule.Component:extend("Connected-" .. tostring(p2))
			
			function ExtendResult.render(p3)
				-- upvalues: ReactModule (upval), p1 (upval), p2 (copy), Dictionary (upval), transformedMapper (upval)
				return ReactModule.createElement(p1.Consumer, {
					render = function(p4)
						-- upvalues: ReactModule (upval), p2 (upval), Dictionary (upval), p3 (copy), transformedMapper (upval)
						return ReactModule.createElement(p2, Dictionary.join(p3.props, transformedMapper(p4, p3.props)))
					end
				})
			end
			
			return ExtendResult
		end
	end
end

return function(p1)
	-- upvalues: ReactModule (copy), Dictionary (copy)
	local Context = ReactModule.createContext(p1)
	
	return {
		Consumer = Context.Consumer,
		Provider = Context.Provider,
		connect = function(Callback)
			-- upvalues: Dictionary (upval), ReactModule (upval), Context (copy)
			local function transformedMapper(p2, Props)
				-- upvalues: Dictionary (upval), Callback (copy)
				return Dictionary.map(Callback(Props), function(p3, _)
					-- upvalues: p2 (copy)
					local Success, Result = pcall(function()
						-- upvalues: p2 (upval), p3 (copy)
						return p2:TranslateGameText(game, p3)
					end)
					
					return if Success then Result else ""
				end)
			end
			
			return function(p2)
				-- upvalues: ReactModule (upval), Context (upval), Dictionary (upval), transformedMapper (copy)
				local ExtendResult = ReactModule.Component:extend("Connected-" .. tostring(p2))
				
				function ExtendResult.render(p3)
					-- upvalues: ReactModule (upval), Context (upval), p2 (copy), Dictionary (upval), transformedMapper (upval)
					return ReactModule.createElement(Context.Consumer, {
						render = function(p4)
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