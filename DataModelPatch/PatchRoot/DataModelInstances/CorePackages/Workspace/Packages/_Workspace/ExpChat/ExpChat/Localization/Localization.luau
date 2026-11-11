local Parent = script:FindFirstAncestor("ExpChat").Parent
local RoactModule = require(Parent.Roact)
local ReactModule = require(Parent.React)
local Dictionary = require(Parent.llama).Dictionary

local function mapStringToBeLocalized(UseContextResult, Entry)
	if type(Entry) == "table" then
		local Success, Result = pcall(function()
			-- upvalues: UseContextResult (copy), Entry (copy)
			return UseContextResult:FormatByKey(Entry[1], Entry[2])
		end)
		
		return if Success then Result else ""
	elseif type(Entry) == "string" then
		local Success1, Result1 = pcall(function()
			-- upvalues: UseContextResult (copy), Entry (copy)
			return UseContextResult:FormatByKey(Entry)
		end)
		
		return if Success1 then Result1 else ""
	else
		return ""
	end
end

local function _(p1)
	-- upvalues: Dictionary (copy), mapStringToBeLocalized (copy), RoactModule (copy)
	return function(Callback)
		-- upvalues: Dictionary (upval), mapStringToBeLocalized (upval), RoactModule (upval), p1 (copy)
		local function transformedMapper(p2, Props)
			-- upvalues: Dictionary (upval), Callback (copy), mapStringToBeLocalized (upval)
			return Dictionary.map(Callback(Props), function(p3, _)
				-- upvalues: mapStringToBeLocalized (upval), p2 (copy)
				return (mapStringToBeLocalized(p2, p3))
			end)
		end
		
		return function(p2)
			-- upvalues: RoactModule (upval), p1 (upval), Dictionary (upval), transformedMapper (copy)
			local ExtendResult = RoactModule.Component:extend("Connected-" .. tostring(p2))
			
			function ExtendResult.render(p3)
				-- upvalues: RoactModule (upval), p1 (upval), p2 (copy), Dictionary (upval), transformedMapper (upval)
				return RoactModule.createElement(p1.Consumer, {
					render = function(p4)
						-- upvalues: RoactModule (upval), p2 (upval), Dictionary (upval), p3 (copy), transformedMapper (upval)
						return RoactModule.createElement(p2, Dictionary.join(p3.props, transformedMapper(p4, p3.props)))
					end
				})
			end
			
			return ExtendResult
		end
	end
end

local _ = function(p1)
	-- upvalues: ReactModule (copy), Dictionary (copy), mapStringToBeLocalized (copy)
	return function(p2)
		-- upvalues: ReactModule (upval), p1 (copy), Dictionary (upval), mapStringToBeLocalized (upval)
		local UseContextResult = ReactModule.useContext(p1)
		
		return Dictionary.map(p2, function(p3, _)
			-- upvalues: mapStringToBeLocalized (upval), UseContextResult (copy)
			return (mapStringToBeLocalized(UseContextResult, p3))
		end)
	end
end

return function(p1)
	-- upvalues: RoactModule (copy), Dictionary (copy), mapStringToBeLocalized (copy), ReactModule (copy)
	local Context = RoactModule.createContext(p1)
	
	return {
		Consumer = Context.Consumer,
		Provider = Context.Provider,
		connect = function(Callback)
			-- upvalues: Dictionary (upval), mapStringToBeLocalized (upval), RoactModule (upval), Context (copy)
			local function transformedMapper(p2, Props)
				-- upvalues: Dictionary (upval), Callback (copy), mapStringToBeLocalized (upval)
				return Dictionary.map(Callback(Props), function(p3, _)
					-- upvalues: mapStringToBeLocalized (upval), p2 (copy)
					return (mapStringToBeLocalized(p2, p3))
				end)
			end
			
			return function(p2)
				-- upvalues: RoactModule (upval), Context (upval), Dictionary (upval), transformedMapper (copy)
				local ExtendResult = RoactModule.Component:extend("Connected-" .. tostring(p2))
				
				function ExtendResult.render(p3)
					-- upvalues: RoactModule (upval), Context (upval), p2 (copy), Dictionary (upval), transformedMapper (upval)
					return RoactModule.createElement(Context.Consumer, {
						render = function(p4)
							-- upvalues: RoactModule (upval), p2 (upval), Dictionary (upval), p3 (copy), transformedMapper (upval)
							return RoactModule.createElement(p2, Dictionary.join(p3.props, transformedMapper(p4, p3.props)))
						end
					})
				end
				
				return ExtendResult
			end
		end,
		useLocalization = function(p2)
			-- upvalues: ReactModule (upval), Context (copy), Dictionary (upval), mapStringToBeLocalized (upval)
			local UseContextResult = ReactModule.useContext(Context)
			
			return Dictionary.map(p2, function(p3, _)
				-- upvalues: mapStringToBeLocalized (upval), UseContextResult (copy)
				return (mapStringToBeLocalized(UseContextResult, p3))
			end)
		end
	}
end