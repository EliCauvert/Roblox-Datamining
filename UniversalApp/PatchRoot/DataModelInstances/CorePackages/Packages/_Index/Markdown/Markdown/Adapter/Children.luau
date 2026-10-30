local _ = require(script:FindFirstAncestor("Markdown").Parent.CommonMark)
local _ = require(script.Parent.Registry)

return {
	units = function(p1, p2, p3)
		local List1 = {}
		local List = nil
		
		local function _()
			-- upvalues: List (ref), List1 (copy)
			if List ~= nil then
				table.insert(List1, { inlines = List })
				List = nil
			end
		end
		
		local FirstChilds = { p1:getFirstChild() }
		local Count = 1
		while Count > 0 do
			local FirstChild = FirstChilds[Count]
			
			if FirstChild == nil then
				FirstChilds[Count] = nil
				Count -= 1
				
				if List == nil then continue end
				table.insert(List1, { inlines = List })
				List = nil
				continue
			else
				FirstChilds[Count] = FirstChild:getNext()
				
				if FirstChild.isBlock then
					local Handler = if p3 and FirstChild.kind == "ListItem" then "handler" else (p2.block[FirstChild.kind] or p2.unknownBlock).form
					
					if Handler == "drop" then continue end
					if Handler == "children" then
						if List ~= nil then
							table.insert(List1, { inlines = List })
							List = nil
						end
						Count += 1
						FirstChilds[Count] = FirstChild:getFirstChild()
					else
						if List ~= nil then
							table.insert(List1, { inlines = List })
							List = nil
						end
						table.insert(List1, { block = FirstChild })
					end
				elseif List == nil then
					List = { FirstChild }
				else
					table.insert(List, FirstChild)
				end
			end
		end
		return List1
	end,
	isList = function(p4): boolean
		local Block = p4.block
		
		return Block ~= nil and (Block.kind == "BulletList" or Block.kind == "OrderedList")
	end,
	isParagraphLike = function(p4): boolean
		local Block = p4.block
		
		return Block == nil or Block.kind == "Paragraph"
	end
}