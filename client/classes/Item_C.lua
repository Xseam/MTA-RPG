Item_C = inherit(Class)

function Item_C:constructor(itemProperties)
	
	self.id = itemProperties.id
	self.slotID = itemProperties.slotID
	self.player = itemProperties.player
	self.name = itemProperties.name
	self.description = itemProperties.id
	self.stats = itemProperties.stats
	self.quality = itemProperties.quality
	self.color = itemProperties.color
	self.costs = itemProperties.costs
	self.class = itemProperties.class
	self.icon = itemProperties.icon
	self.stackable = itemProperties.stackable
	
	self.texture = nil
	
	self:init()
	
	if (Settings.showClassDebugInfo == true) then
		sendMessage("Item_C " .. self.id .. " was loaded.")
	end
end


function Item_C:init()
	if (self.icon) then
		local iconValues = string.split(self.icon, "|")
					
		if (iconValues) then
			if (iconValues[1]) and (iconValues[2]) and (iconValues[3]) then
				if (Textures[iconValues[1]][iconValues[2]][tonumber(iconValues[3])]) then
					if (Textures[iconValues[1]][iconValues[2]][tonumber(iconValues[3])].texture) then
						self.texture = Textures[iconValues[1]][iconValues[2]][tonumber(iconValues[3])].texture
					end
				end
			end
		end
	end
	
	GUIInventory_C:getSingleton():addItem(self)
end


function Item_C:getTexture()
	return self.texture
end


function Item_C:clear()

end


function Item_C:destructor()
	self:clear()

	if (Settings.showClassDebugInfo == true) then
		sendMessage("Item_C " .. self.id .. " was deleted.")
	end
end