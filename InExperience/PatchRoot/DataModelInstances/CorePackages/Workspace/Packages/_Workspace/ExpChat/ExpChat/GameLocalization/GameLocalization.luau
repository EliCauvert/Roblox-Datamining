local parent = script:FindFirstAncestor("ExpChat").Parent
local reactModule = require(parent.React)
local dictionary = require(parent.llama).Dictionary

local function _(p1)
	-- upvalues: dictionary (ref), reactModule (ref)
	return function(p2)
		-- upvalues: dictionary (copy), reactModule (copy), p1 (ref)
		local function transformedMapper(p3, p4)
			-- upvalues: dictionary (copy), p2 (ref)
			return dictionary.map(p2(p4), function(p5, _)
				-- upvalues: p3 (ref)
				local ok, status = pcall(function()
					-- upvalues: p3 (copy), p5 (ref)
					return p3:TranslateGameText(game, p5)
				end)
				
				return if ok then status else ""
			end)
		end
		
		return function(p3)
			-- upvalues: reactModule (copy), p1 (copy), dictionary (copy), transformedMapper (ref)
			local var1 = reactModule.Component:extend("Connected-" .. tostring(p3))
			
			function var2.render(p4)
				-- upvalues: reactModule (copy), p1 (copy), p3 (ref), dictionary (copy), transformedMapper (copy)
				return reactModule.createElement(p1.Consumer, {
					render = function(p5)
						-- upvalues: reactModule (copy), p3 (copy), dictionary (copy), p4 (ref), transformedMapper (copy)
						return reactModule.createElement(p3, dictionary.join(p4.props, transformedMapper(p5, p4.props)))
					end
				})
			end
			
			return var1
		end
	end
end

return function(p1)
	-- upvalues: reactModule (ref), dictionary (ref)
	local var1 = reactModule.createContext(p1)
	
	return {
		Consumer = var1.Consumer,
		Provider = var1.Provider,
		connect = function(p2)
			-- upvalues: dictionary (copy), reactModule (copy), var1 (ref)
			local function transformedMapper(p3, p4)
				-- upvalues: dictionary (copy), p2 (ref)
				return dictionary.map(p2(p4), function(p5, _)
					-- upvalues: p3 (ref)
					local ok, status = pcall(function()
						-- upvalues: p3 (copy), p5 (ref)
						return p3:TranslateGameText(game, p5)
					end)
					
					return if ok then status else ""
				end)
			end
			
			return function(p3)
				-- upvalues: reactModule (copy), var1 (copy), dictionary (copy), transformedMapper (ref)
				local var2 = reactModule.Component:extend("Connected-" .. tostring(p3))
				
				function var2.render(p4)
					-- upvalues: reactModule (copy), var1 (copy), p3 (ref), dictionary (copy), transformedMapper (copy)
					return reactModule.createElement(var1.Consumer, {
						render = function(p5)
							-- upvalues: reactModule (copy), p3 (copy), dictionary (copy), p4 (ref), transformedMapper (copy)
							return reactModule.createElement(p3, dictionary.join(p4.props, transformedMapper(p5, p4.props)))
						end
					})
				end
				
				return var2
			end
		end
	}
end