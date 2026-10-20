local Parent = script:FindFirstAncestor("DiscoveryMonolith").Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local ArgCheckModule = require(Parent.ArgCheck)
local CollectionHeader = require(Parent.CollectionViews).CollectionHeader
local SearchSourceEvent = require(Parent.DiscoveryTypes).SearchSourceEvent
local ContextModule = require(script.Parent.Context)

return function(Frame)
	-- upvalues: ReactModule (copy), ContextModule (copy), ArgCheckModule (copy), CryoModule (copy), CollectionHeader (copy), SearchSourceEvent (copy)
	local UseContextResult = ReactModule.useContext(ContextModule)
	ArgCheckModule.assert(UseContextResult ~= nil, "Using selection header component outside of SearchTypeSelection context")
	
	if UseContextResult then
		local FilterResultEntry = CryoModule.List.filter(UseContextResult.selections or {}, function(p1): boolean
			-- upvalues: Frame (copy)
			return p1 and p1.name == Frame.selectionType
		end)[1]
		ArgCheckModule.assert(FilterResultEntry ~= nil, "Trying to navigate to non existing selection")
		
		return if FilterResultEntry then ReactModule.createElement(CollectionHeader, {
			LayoutOrder = Frame.LayoutOrder,
			title = FilterResultEntry.text,
			onActivate = function()
				-- upvalues: FilterResultEntry (copy), SearchSourceEvent (upval)
				if FilterResultEntry.onActivated then
					FilterResultEntry.onActivated(SearchSourceEvent.SeeAll)
				end
			end
		}) else nil
	else
		return nil
	end
end