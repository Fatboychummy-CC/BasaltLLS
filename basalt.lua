---@meta

--------------------------------------------------------------------------------
--                                Basalt Main                                 --
--------------------------------------------------------------------------------

---@class Basalt
local basalt = {}



-- Main methods



--- Starts the event and draw listener
---@see Basalt.stopUpdate
---@see Basalt.stop
---@param stopUpdate boolean? If false, will stop the event/draw listeners instead (like basalt.stopUpdate()).
function basalt.autoUpdate(stopUpdate)end

--- Creates a new base frame, which is a frame without a parent. You can have as many base frames as you want, but only one can be visible at a time. Only the currently active base frame listens to incoming events.
---@param id string? The ID of the frame. If not specified, a random ID will be generated.
---@return BasaltFrame
function basalt.createFrame(id)end

--- Log information to the debug frame.
---@param ... any The values to log.
function basalt.debug(...)end

--- Get a base frame by the given ID.
---@param id string The ID of the frame.
---@return BasaltFrame
function basalt.getFrame(id)end

--- Get the currently active base frame.
---@see Basalt.setActiveFrame
---@return BasaltFrame
function basalt.getActiveFrame()end

--- Get the current base-theme.
---@see Basalt.setTheme
---@param id string The ID of the theme.
---@return Color color The color of the theme.
function basalt.getTheme(id)end

--- Return a variable defined by setVariable().
---@see Basalt.setVariable
---@param key string The key name of the variable.
---@return any The value of the variable.
function basalt.getVariable(key)end

--- Returns the current version of Basalt.
---@return string versionString The current version of Basalt.
function basalt.getVersion()end

--- Check if the user is currently holding a specified key down.
---@param key integer The key to check (use the keys table).
---@return boolean isDown Whether the key is down.
function basalt.isKeyDown(key)end

--- Write a message to the log file, useful for debugging errors.
---@param message string The message to write to the log file.
---@param category string? The type/category of the log message. Defaults to "Debug".
function basalt.log(message, category)end

--- Return the amount of memory used by Basalt in bytes.
---@return integer memory The amount of memory used by Basalt in bytes.
function basalt.memory()end

--- A top-level method to intercept an event before sending it to the object event handlers. If you `return false`, the event will not be sent to the object event handlers.
---@param func fun(event:string, ...:any):boolean The function to call when an event is intercepted.
function basalt.onEvent(func)end

--- Remove a previously created base frame.
---@param id string The ID of the frame.
function basalt.removeFrame(id)end

--- Schedule a function which gets called in a coroutine.
---@param func function The function to call.
---@return function scheduled_function The scheduled function, call it to start the coroutine.
function basalt.schedule(func)end

--- Set the currently active base frame.
---@see Basalt.getActiveFrame
---@param frame BasaltFrame The frame to set as active.
function basalt.setActiveFrame(frame)end

--- Set the base-theme.
---@see Basalt.getTheme
---@param theme BasaltTheme The theme to set as base-theme.
function basalt.setTheme(theme)end

--- Change the drag throttle of all drag events (default is 50 ms, 0.05s). This helps prevent a flood of `mouse_drag` events sent to all :onDrag() handlers.
---@param throttle number The new throttle in milliseconds.
function basalt.setDragThrottle(throttle)end

--- Set the move throttle of all move events (default is 50 ms, 0.05s). This helps prevent a flood of `mouse_move` events. This feature is only available on CraftOS-PC. Warning: Do not set this value too low.
---@param throttle number The new throttle in milliseconds.
function basalt.setMouseMoveThrottle(throttle)end

--- Set the rendering throttle for Basalt's automatic update process. This determines how often the screen is updated during the auto-update loop.
---@param throttle number The new throttle in milliseconds.
function basalt.setRenderThrottle(throttle)end

--- Set a variable that can be retrieved by getVariable().
---@param key string The key name of the variable.
---@param value any The value of the variable.
function basalt.setVariable(key, value)end

--- Stop the event and draw listener
---@see Basalt.autoUpdate
function basalt.stopUpdate()end
basalt.stop = basalt.stopUpdate

--- Calls the draw and event handler once.
---@param event string The event to call.
---@param ... any Additional event arguments.
function basalt.update(event, ...)end

--- Allows you to add new custom objects (elements) to the Basalt framework. This method *must* be called before `basalt.autoUpdate`, and can only be used during initialization phase.
---@param path string The path to the lua file or folder containing the custom objects.
function basalt.addObject(path)end

--- Allows you to add new custom plugins to the Basalt framework. This method *must* be called before `basalt.autoUpdate`, and can only be used during initialization phase.
---@param path string The path to the lua file or folder containing the custom plugins.
function basalt.addPlugin(path)end



--------------------------------------------------------------------------------
--                                BasaltObject                                --
--------------------------------------------------------------------------------

---@class BasaltObject The fundamental building block class of all other objects and components.
local object = {}



-- Main methods



--- Enable event listeners on the object.
---@see BasaltObject.disable
---@return self
function object:enable()end

--- Disable event listeners on the object.
---@see BasaltObject.enable
---@return self
function object:disable()end

--- Get the object's type.
---@return string type The object's type.
function object:getType()end

--- Check if the object is of a specific type.
---@param type string The type to check.
---@return boolean isType Whether the object is of the specified type, or if it inherits from the specified type.
function object:isType(type)end

--- Get the name of the object.
---@return string name The object's name.
function object:getName()end

--- Get the parent of the object.
---@return BasaltObject parent The object's parent.
function object:getParent()end

--- Set the parent of the object.
---@param parent BasaltObject The object's new parent.
---@return self
function object:setParent(parent)end

--- Get the Z index of the object. Objects with higher Z index values will be displayed on top of objects with lower Z index values.
---@return number zIndex The object's Z index.
function object:getZIndex()end

--- Remove the object from its parent, and stops the object receiving any events or being drawn. This does not actually destroy the object.
---@return self
function object:remove()end



-- Events



--- Register an event handler for when the object is clicked.
---@param func fun(self:self, event:string, button:integer, x:integer, y:integer) The function to call when the object is clicked.
---@return self
function object:onClick(func)end

--- Register an event handler for when the mouse button is released on the object.
---@see BasaltObject.onRelease
---@param func fun(self:self, event:string, button:integer, x:integer, y:integer) The function to call when the mouse button is released on the object.
---@return self
function object:onClickUp(func)end

--- Register an event handler for when the mouse button is released. onRelease is called if the mouse started on the button then moved off, while onClickUp is only called if the mouse ended on the button.
---@see BasaltObject.onClickUp
---@param func fun(self:self, event:string, button:integer, x:integer, y:integer) The function to call when the mouse button is released.
---@return self
function object:onRelease(func)end

--- Register an event handler for when a mouse scroll occurs over the object.
---@param func fun(self:self, event:string, direction:integer, x:integer, y:integer) The function to call when a mouse scroll occurs over the object.
---@return self
function object:onScroll(func)end

--- Register an event handler for when the mouse is dragging this object.
---@param func fun(self:self, event:string, button:integer, x:integer, y:integer, dx:integer, dy:integer) The function to call when the mouse is dragging this object.
---@return self
function object:onDrag(func)end

--- Register an event handler for when the mouse is moved over the object. This event is only available in CraftOS-PC.
---@param func fun(self:self, event:string, x:integer, y:integer) The function to call when the mouse is moved over the object.
---@return self
function object:onHover(func)end

--- Register an event handler for when the mouse is moved away from the object. This event is only available in CraftOS-PC.
---@param func fun(self:self, event:string, x:integer, y:integer) The function to call when the mouse is moved away from the object.
---@return self
function object:onLeave(func)end

--- Register an event handler for when a key is pressed.
---@param func fun(self:self, event:string, key:integer) The function to call when a key is pressed.
---@return self
function object:onKey(func)end

--- Register an event handler for when a character is typed.
---@param func fun(self:self, event:string, char:string) The function to call when a character is typed.
---@return self
function object:onChar(func)end

--- Register an event handler for when a key is released.
---@param func fun(self:self, event:string, key:integer) The function to call when a key is released.
---@return self
function object:onKeyUp(func)end

--- Register an event handler for when the object gains focus (occurs when the object is clicked).
---@param func fun(self:self) The function to call when the object gains focus.
---@return self
function object:onGetFocus(func)end

--- Register an event handler for when the object loses focus (occurs when another object is clicked).
---@param func fun(self:self) The function to call when the object loses focus.
---@return self
function object:onLoseFocus(func)end

--- Register an event handler for any other event that is not handled by the specific event methods.
---@param func fun(self:self, event:string, ...:any) The function to call when an event is received.
---@return self
function object:onEvent(func)end

--- Add a new thread. WARNING: I am unsure where this method actually exists, so I am applying it to all objects until I can find it.
---@param func function The function to call.
---@return BasaltThread thread The thread object.
function object:addThread(func)end



--------------------------------------------------------------------------------
--                                VisualObject                                --
--------------------------------------------------------------------------------

---@class BasaltVisualObject : BasaltObject Derived from the BasaltObject class, this class serves as a foundation for all visual components in Basalt.
local visualObject = {}



-- Main methods



--- Makes the object visible if the parent frame is visible.
---@return self
function visualObject:show()end

--- Makes the object and all children invisible.
---@return self
function visualObject:hide()end

--- Sets the visibility of the object.
---@param visible boolean Whether the object should be visible.
---@return self
function visualObject:setVisible(visible)end

--- Returns whether the object is visible.
---@return boolean isVisible Whether the object is visible.
function visualObject:isVisible()end

--- Sets the position of the object. Positions relative to self if `offset` is true (i.e: 1,1 would move it down and right 1).
---@param x number|string The x position of the object, or a dynamic value as a string.
---@param y number|string The y position of the object, or a dynamic value as a string.
---@param offset boolean Whether the position is relative to self.
---@return self
function visualObject:setPosition(x, y, offset)end

--- Returns the position of the object.
---@return number x The x position of the object.
---@return number y The y position of the object.
function visualObject:getPosition()end

--- Returns the x position of the object.
---@return number x The x position of the object.
function visualObject:getX()end

--- Returns the y position of the object.
---@return number y The y position of the object.
function visualObject:getY()end

--- Sets the size of the object.
---@param width number|string The width of the object, or a dynamic value as a string.
---@param height number|string The height of the object, or a dynamic value as a string.
---@return self
function visualObject:setSize(width, height)end

--- Returns the size of the object.
---@return number width The width of the object.
---@return number height The height of the object.
function visualObject:getSize()end

--- Returns the width of the object.
---@return number width The width of the object.
function visualObject:getWidth()end

--- Returns the height of the object.
---@return number height The height of the object.
function visualObject:getHeight()end

--- Sets the background color of the object.
---@param color Color|false The background color of the object. Setting this to false will make the background transparent.
---@param symbol string? The symbol to use for the background. Defaults to " ".
---@param symbolColor Color? The color of the symbol. Defaults to the background color.
---@return self
function visualObject:setBackground(color, symbol, symbolColor)end

--- Returns the background color of the object.
---@return Color|false color The background color of the object.
function visualObject:getBackground()end

--- Sets the foreground color of the object.
---@param color Color The foreground color of the object.
---@return self
function visualObject:setForeground(color)end

--- Returns the foreground color of the object.
---@return Color color The foreground color of the object.
function visualObject:getForeground()end

--- Set the transparency of the object.
---@param transparency number The transparency of the object (0-1).
---@return self
function visualObject:setTransparency(transparency)end

--- Set the Z index of the object. Objects with higher Z index values will be displayed on top of objects with lower Z index values.
---@param zIndex number The Z index of the object.
---@return self
function visualObject:setZIndex(zIndex)end

--- Get the absolute position of this object.
---@param x number? The x position of an offset of the object. Uses the object's position if left nil.
---@param y number? The y position of an offset of the object. Uses the object's position if left nil.
---@return number x The absolute x position of the object.
---@return number y The absolute y position of the object.
function visualObject:getAbsolutePosition(x, y)end

--- Sets whether or not this object should ignore the offset of the parent's frame.
---@param ignore boolean Whether or not this object should ignore the offset of the parent's frame.
---@return self
function visualObject:ignoreOffset(ignore)end

--- Returns whether or not this object is focused.
---@return boolean isFocused Whether or not this object is focused.
function visualObject:isFocused()end

--- Sets the shadow color of the object.
---@param color Color|false The shadow color of the object. Setting this to false will disable the shadow.
function visualObject:setShadow(color)end

--- Get the shadow color of the object.
---@return Color|false color The shadow color of the object.
function visualObject:getShadow()end

--- Sets the border color of the object.
---@param color Color|false The border color of the object. Setting this to false will disable the border.
---@param ... string The sides of the border to enable. Defaults to all.
---@return self
function visualObject:setBorder(color, ...)end

--- Animate the position of the object within a specified time frame.
---@param x number The x position of the object.
---@param y number The y position of the object.
---@param duration number The duration of the animation in seconds.
---@param offset number? The offset of the animation in seconds.
---@param animationMode string? The animation mode to use. Defaults to "linear".
---@param callback function? The function to call when the animation is complete.
---@return self
function visualObject:animatePosition(x, y, duration, offset, animationMode, callback)end

--- Animate the size of the object within a specified time frame.
---@param width number The width of the object.
---@param height number The height of the object.
---@param duration number The duration of the animation in seconds.
---@param offset number? The offset of the animation in seconds.
---@param animationMode string? The animation mode to use. Defaults to "linear".
---@param callback function? The function to call when the animation is complete.
---@return self
function visualObject:animateSize(width, height, duration, offset, animationMode, callback)end

--- Animate the offset of an object within a specified time frame.
---@param x number The x offset of the object.
---@param y number The y offset of the object.
---@param duration number The duration of the animation in seconds.
---@param offset number? The offset of the animation in seconds.
---@param animationMode string? The animation mode to use. Defaults to "linear".
---@param callback function? The function to call when the animation is complete.
---@return self
function visualObject:animateOffset(x, y, duration, offset, animationMode, callback)end

--- Adds a texture to an object (bimg image).
---@param path string The path to the image.
---@param animate boolean? Whether or not to animate the texture, if it is animateable.
---@return self
function visualObject:addTexture(path, animate)end

--- Sets the texture mode for an object. The texture mode determines how the texture is displayed on the object.
---@param mode "default"|"center"|"right" The texture mode to use.
---@return self
function visualObject:setTextureMode(mode)end

--- Sets whether the texture animation should play infinitely or not.
---@param infinite boolean Whether the texture animation should play infinitely or not.
---@return self
function visualObject:setInfinitePlay(infinite)end



-- Custom draw calls



---@return self
function visualObject:addDraw()end

---@return self
function visualObject:addPreDraw()end

---@return self
function visualObject:addPostDraw()end

---@return self
function visualObject:setDrawState(name, state)end

---@return self
function visualObject:getDrawId()end

---@return self
function visualObject:addText()end

---@return self
function visualObject:addBG()end

---@return self
function visualObject:addFG()end

---@return self
function visualObject:addBlit()end

---@return self
function visualObject:addTextBox()end

---@return self
function visualObject:addBackgroundBox()end

---@return self
function visualObject:addForegroundBox()end



-- Events



--- Register an event handler for when the object is resized.
---@param func fun(self:self) The function to call when the object is resized.
---@return self
function visualObject:onResize(func)end

--- Register an event handler for when the object is moved.
---@param func fun(self:self) The function to call when the object is moved.
function visualObject:onReposition(func)end



-- FlexBox methods



--- This method is only available to children of FlexBoxes. Set the flex-grow value of the object. This determines how much the object will grow relative to the other objects in the flexbox.
---@param grow number The flex-grow factor of the object.
---@return self
function object:setFlexGrow(grow)end

--- This method is only available to children of FlexBoxes. Get the flex-grow value of the object.
---@return number grow The flex-grow factor of the object.
function object:getFlexGrow()end

--- This method is only available to children of FlexBoxes. Set the flex-shrink value of the object. This determines how much the object will shrink relative to the other objects in the flexbox.
---@param shrink number The flex-shrink factor of the object.
---@return self
function object:setFlexShrink(shrink)end

--- This method is only available to children of FlexBoxes. Get the flex-shrink value of the object.
---@return number shrink The flex-shrink factor of the object.
function object:getFlexShrink()end

--- This method is only available to children of FlexBoxes. Set the flex-basis value of the object. This determines the initial size of the object before any remaining space is distributed.
---@param basis number The flex-basis value of the object.
---@return self
function object:setFlexBasis(basis)end

--- This method is only available to children of FlexBoxes. Get the flex-basis value of the object.
---@return number basis The flex-basis value of the object.
function object:getFlexBasis()end



--------------------------------------------------------------------------------
--                           BasaltChangeableObject                           --
--------------------------------------------------------------------------------

---@class BasaltChangeableObject : BasaltObject 
local changeableObject = {}



-- Main methods



--- Set the value of the object.
---@param value any The value to set.
---@return self
function changeableObject:setValue(value)end

--- Get the value of the object.
---@return any value The value of the object.
function changeableObject:getValue()end



-- Events



--- Register an event handler for when the value of the object is changed.
---@param func fun(self:self, event:string, value:any) The function to call when the value of the object is changed.
function changeableObject:onChange(func)end



--------------------------------------------------------------------------------
--                               BasaltContainer                              --
--------------------------------------------------------------------------------

---@class BasaltContainer : BasaltObject, BasaltVisualObject
local container = {}



-- Main methods



--- Add a child object to the container.
---@param child BasaltObject The child object to add.
---@return self
function container:addChild(child)end

--- Get a child object by its ID.
---@param id string The ID of the child object.
---@return BasaltObject child The child object.
function container:getChild(id)end

--- Get a child (or deeper descendant) object by its id.
---@param id string The ID of the child object.
---@return BasaltObject child The child object.
function container:getDeepChild(id)end

--- Remove a child object from the container.
---@param id BasaltObject The child object to remove.
---@return self
function container:removeChild(id)end

--- Remove all child objects from the container.
---@return self
function container:removeChildren()end

--- Update the Z index of a child object.
---@param child BasaltObject The child object to update.
---@param zIndex number The new Z index of the child object.
---@return self
function container:updateZIndex(child, zIndex)end

--- Mark a specified object as "important" within the container, which means that its Z-index will be updated to be on top of all other objects in the container.
---@param child BasaltObject The child object to mark as important.
---@return self
function container:markImportant(child)end

--- Internal function: called whenever the container has new objects added or removed.
---@return self
function container:sortElementOrder()end

--- Clear the focus from the currently focused object within the container.
---@return self
function container:clearFocusedChild()end

--- Set the focus to a specified object within the container.
---@param child BasaltObject The child object to set focus to.
---@return self
function container:setFocusedChild(child)end



--------------------------------------------------------------------------------
--                                 BasaltBaseFrame                                --
--------------------------------------------------------------------------------

---@class BasaltBaseFrame : BasaltObject, BasaltVisualObject, BasaltContainer The base frame class, which is a frame without a parent.
local baseFrame = {}



-- Main methods



--- Get the offset of the frame.
---@return number x The x offset of the frame.
---@return number y The y offset of the frame.
function baseFrame:getOffset()end

--- Set the offset of the frame.
---@param x number The x offset of the frame.
---@param y number The y offset of the frame.
---@return self
function baseFrame:setOffset(x, y)end



--------------------------------------------------------------------------------
--                             BasaltMonitorFrame                             --
--------------------------------------------------------------------------------

---@class BasaltMonitorFrame : BasaltObject, BasaltVisualObject, BasaltContainer, BasaltBaseFrame
local monitorFrame = {}

---@alias BasaltMonitorFrameGroup table<integer, table<integer, string>>



-- Main methods



--- Set the monitor to use for the frame.
---@param monitor string|table The monitor's network name, or the wrapped monitor object.
---@return self
function monitorFrame:setMonitor(monitor)end

--- Set the monitor group for the monitor frame. This is used to combine multiple in-game monitors into a single larger monitor.
---@param group BasaltMonitorFrameGroup The monitor group to use.
---@return self
function monitorFrame:setMonitorGroup(group)end



--------------------------------------------------------------------------------
--                                 BasaltFrame                                --
--------------------------------------------------------------------------------

---@class BasaltFrame : BasaltObject, BasaltVisualObject, BasaltContainer, BasaltBaseFrame The frame class, which is a container with a parent.
local frame = {}



--------------------------------------------------------------------------------
--                                BasaltFlexBox                               --
--------------------------------------------------------------------------------

---@class BasaltFlexBox : BasaltObject, BasaltVisualObject, BasaltContainer, BasaltFrame, BasaltScrollableFrame The flexbox container is used to create flexible and responsive UI designs, allowing you to efficiently arrange and align its child elements.
local flexBox = {}



-- Main methods



--- Define the gap distance between child objects within the flexbox.
---@param gap number The gap distance between child objects within the flexbox.
---@return self
function flexBox:setSpacing(gap)end

--- Get the gap distance between child objects within the flexbox.
---@return number gap The gap distance between child objects within the flexbox.
function flexBox:getSpacing()end

--- Set the direction in which the children will be placed.
---@param direction "row"|"column" The direction in which the children will be placed.
---@return self
function flexBox:setDirection(direction)end

--- Get the direction in which the children will be placed.
---@return "row"|"column" direction The direction in which the children will be placed.
function flexBox:getDirection()end

--- Set how the children will be aligned along the main axis.
---@param alignment "flex-start"|"flex-end"|"center"|"space-between"|"space-around"|"space-evenly" The alignment of the children along the main axis.
---@return self
function flexBox:setAlignment(alignment)end

--- Get how the children will be aligned along the main axis.
---@return "flex-start"|"flex-end"|"center"|"space-between"|"space-around"|"space-evenly" alignment The alignment of the children along the main axis.
function flexBox:getAlignment()end

--- Set whether the child objects should wrap onto the next line when there isn't enough room along the main axis. Default is "nowrap".
---@param wrap "nowrap"|"wrap" The wrap mode of the flexbox.
---@return self
function flexBox:setWrap(wrap)end

--- Get whether the child objects should wrap onto the next line when there isn't enough room along the main axis.
---@return "nowrap"|"wrap" wrap The wrap mode of the flexbox.
function flexBox:getWrap()end

--- Forces the flexbox container to manually update its layout. Useful in situations where dynamic changes occur within the flexbox, and you want to ensure that the layout correctly reflects these changes.
---@return self
function flexBox:updateLayout()end

--- Adds a line break to the FlexBox container.
---@return self
function flexBox:addBreak()end



--------------------------------------------------------------------------------
--                             BasaltMovableFrame                             --
--------------------------------------------------------------------------------

---@class BasaltMovableFrame : BasaltObject, BasaltVisualObject, BasaltContainer, BasaltFrame The movable frame class, which is a frame that can be moved around the screen.
local movableFrame = {}

---@class BasaltDragMap
---@field x1 number The starting x position of the draggable area.
---@field y1 number The starting y position of the draggable area.
---@field x2 number The ending x position of the draggable area.
---@field y2 number The ending y position of the draggable area.



-- Main methods



--- Creats a XY map for the areas where the MovableFrame can be dragged with the mouse.
---@param map BasaltDragMap The map to use.
---@return self
function movableFrame:setDragggingMap(map)end

--- Get the XY map for the areas where the MovableFrame can be dragged with the mouse.
---@return BasaltDragMap map The map to use.
function movableFrame:getDragggingMap()end



--------------------------------------------------------------------------------
--                            BasaltScrollableFrame                            --
--------------------------------------------------------------------------------

---@class BasaltScrollableFrame : BasaltObject, BasaltVisualObject, BasaltContainer, BasaltFrame The scrolling frame class, which is a frame that can be scrolled.
local scrollableFrame = {}



-- Main methods



--- Set the scrolling direction of the frame.
---@param direction "horizontal"|"vertical" The scrolling direction of the frame.
---@return self
function scrollableFrame:setDirection(direction)end



--------------------------------------------------------------------------------
--                                BasaltButton                                --
--------------------------------------------------------------------------------

---@class BasaltButton : BasaltObject, BasaltVisualObject The button class, which is a clickable object.
local button = {}

---@alias HorizontalAlign
---| '"left"'
---| '"center"'
---| '"right"'



-- Main methods



--- Set the text of the button.
---@param text string The text of the button.
---@return self
function button:setText(text)end

--- Set the horizontal text position
---@param position HorizontalAlign The horizontal text position.
---@return self
function button:setHorizontalAlign(position)end

--- Set the vertical text position
---@param position "top"|"center"|"bottom" The vertical text position.
---@return self
function button:setVerticalAlign(position)end



--------------------------------------------------------------------------------
--                               BasaltCheckbox                               --
--------------------------------------------------------------------------------

---@class BasaltCheckbox : BasaltObject, BasaltVisualObject, BasaltChangeableObject The checkbox class, which is a clickable object that can be checked or unchecked.
local checkbox = {}



-- Main methods



--- Set the symbol of the checkbox when it is checked.
---@param symbol string The symbol of the checkbox when it is checked.
---@return self
function checkbox:setSymbol(symbol)end



--------------------------------------------------------------------------------
--                                 BasaltGraph                                --
--------------------------------------------------------------------------------

---@class BasaltGraph : BasaltObject, BasaltVisualObject, BasaltChangeableObject A versatile object for visualizing data in various formats.
local graph = {}



-- Main methods



--- Set the color of the graph.
---@param color Color The color of the graph.
---@return self
function graph:setGraphColor(color)end

--- Set the symbol used to represent data points in the graph.
---@param symbol string The symbol used to represent data points in the graph.
---@return self
function graph:setGraphSymbol(symbol)end

--- Get the symbol used to represent data points in the graph.
---@return string symbol The symbol used to represent data points in the graph.
function graph:getGraphSymbol()end

--- Add a data point to the graph.
---@param value number The value of the data point (Default range: 0-100).
---@return self
function graph:addDataPoint(value)end

--- Set the max value displayed on the graph.
---@param max number The max value displayed on the graph.
---@return self
function graph:setMaxValue(max)end

--- Get the max value displayed on the graph.
---@return number max The max value displayed on the graph.
function graph:getMaxValue()end

--- Set the min value displayed on the graph.
---@param min number The min value displayed on the graph.
---@return self
function graph:setMinValue(min)end

--- Get the min value displayed on the graph.
---@return number min The min value displayed on the graph.
function graph:getMinValue()end

--- Set the type of graph to display.
---@param type "scatter"|"line"|"bar" The type of graph to display.
---@return self
function graph:setGraphType(type)end

--- Set the maximum number of data points to display on the graph.
---@param maxEntries number The maximum number of data points to display on the graph.
---@return self
function graph:setMaxEntries(maxEntries)end

--- Get the maximum number of data points to display on the graph.
---@return number maxEntries The maximum number of data points to display on the graph.
function graph:getMaxEntries()end



--------------------------------------------------------------------------------
--                                 BasaltImage                                --
--------------------------------------------------------------------------------

---@class BasaltImage : BasaltObject, BasaltVisualObject The image class, which is a visual object that displays an image.
local image = {}



-- Main methods



--- Loads an image from the specified file path.
---@param path string The path to the image file (nfp or bimg).
---@return self
function image:loadImage(path)end

--- Sets the image to display.
---@param image table The image to display.
---@param format "nfp"|"bimg" The format of the image.
---@return self
function image:setImage(image, format)end

--- Changes the palette to the image's preferred palette.
---@param use boolean Whether to use the image's preferred palette.
---@return self
function image:usePalette(use)end

--- Plays a bimg animation. This only works if the bimg has more than 1 frame.
---@param play boolean Whether to play the animation.
---@return self
function image:play(play)end

--- Select the frame of the bimg animation to display.
---@param frame number The frame of the bimg animation to display.
---@return self
function image:setFrame(frame)end

--- Get metadata about the image.
---@param key string The key of the metadata to get.
---@return any value The value of the metadata.
function image:getMetadata(key)end

--- Set the size of the image.
---@param width number The width of the image.
---@param height number The height of the image.
---@return self
function image:setImageSize(width, height)end

--- Get the size of the image.
---@return number width The width of the image.
---@return number height The height of the image.
function image:getImageSize()end

--- Resize the image.
---@param width number The new width of the image.
---@param height number The new height of the image.
---@return self
function image:resizeImage(width, height)end

--- Set the image's coordinate offset.
---@param x number The x offset of the image.
---@param y number The y offset of the image.
---@return self
function image:setOffset(x, y)end

--- Get the image's coordinate offset.
---@return number x The x offset of the image.
---@return number y The y offset of the image.
function image:getOffset()end

--- Add a new frame to the image object. Used for creating animations from multiple frames.
---@param index number The index of the frame to add.
---@param frame table The frame to add, in bimg format.
---@return self
function image:addFrame(index, frame)end

--- Retrieve a frame from the image object.
---@param index number The index of the frame to retrieve.
---@return table frame The frame, in bimg format.
function image:getFrame(index)end

--- Retrieve a frame object from the image object at the specified index.
---@param index number The index of the frame to retrieve.
---@return BasaltImage frame The frame object.
function image:getFrameObject(index)end

--- Remove a frame from the image object.
---@param index number The index of the frame to remove.
---@return self
function image:removeFrame(index)end

--- Move a frame from one index to another within the image object.
---@param fromIndex number The index of the frame to move.
---@param toIndex number The index to move the frame to.
---@return self
function image:moveFrame(fromIndex, toIndex)end

--- Get a table containing all the frames in the image object.
---@return table<integer, table> frames A table containing all the frames in the image object.
function image:getFrames()end

--- Get the total number of frames in the image object.
---@return number count The total number of frames in the image object.
function image:getFrameCount()end

--- Get the index of the currently active frame in the image object.
---@return number index The index of the currently active frame in the image object.
function image:getActiveFrame()end

--- Clears all frames from the image object.
---@return self
function image:clear()end

--- Get the current image of the image object in its internal format (raw data).
---@return table image The current image of the image object in its internal format (raw data).
function image:getImage()end

--- Writes text/foreground/background into the image object. Unknown what it actually does, basalt docs lead to a 404. Please update this if you know!
---@param text string The text to write.
---@param foreground string The foreground color of the text (presumably in blit format).
---@param background string The background color of the text (presumably in blit format).
---@return self
function image:blit(text, foreground, background)end

--- Sets or modifies the text at a specified position in the currently active frame of the image object.
---@param text string The text to write.
---@param x number The x position of the text.
---@param y number The y position of the text.
function image:setText(text, x, y)end

--- Sets or modifies the background color at a specified position in the currently active frame of the image object.
---@param color string The background color of the text (presumably in blit format).
---@param x number The x position of the text.
---@param y number The y position of the text.
function image:setBg(color, x, y)end

--- Sets or modifies the foreground color at a specified position in the currently active frame of the image object.
---@param color string The foreground color of the text (presumably in blit format).
---@param x number The x position of the text.
---@param y number The y position of the text.
function image:setFg(color, x, y)end

--- Shrink the image data into a blit-image version of the standard object. This is irreversible, and some information will be lost.
---@return self
function image:shrink()end



--------------------------------------------------------------------------------
--                                BasaltInput                                 --
--------------------------------------------------------------------------------

---@class BasaltInput : BasaltObject, BasaltVisualObject, BasaltChangeableObject The input class, which is a visual object that allows the user to input text.
local input = {}



-- Main methods



--- Set the input type of the input object.
---@param type "text"|"password"|"number" The input type of the input object.
---@return self
function input:setInputType(type)end

--- Get the input type of the input object.
---@return "text"|"password"|"number" type The input type of the input object.
function input:getInputType()end

--- Set the default text of the input object.
---@param text string The default text of the input object.
---@param bg string? The default background color of the input object.
---@param fg string? The default foreground color of the input object.
---@return self
function input:setDefaultText(text, bg, fg)end

--- Set a character limit for the input object.
---@param limit number The character limit for the input object.
---@return self
function input:setInputLimit(limit)end

--- Get the character limit for the input object.
---@return number limit The character limit for the input object.
function input:getInputLimit()end

--- This method's documentation page leads to a 404.
---@param ... unknown
---@return self
function input:setOffset(...)end

--- This method's documentation page leads to a 404.
---@param ... unknown
---@return unknown
function input:getOffset(...)end

--- This method's documentation page leads to a 404.
---@param ... unknown
---@return self
function input:setTextOffset(...)end

--- This method's documentation page leads to a 404.
---@param ... unknown
---@return unknown
function input:getTextOffset(...)end



--------------------------------------------------------------------------------
--                                BasaltLabel                                 --
--------------------------------------------------------------------------------

---@class BasaltLabel : BasaltObject, BasaltVisualObject A label object is used to display simple text on the interface.
local label = {}

---@alias BigfontFontSize 
---| `1`
---| `2`
---| `3`
---| `4`



-- Main methods



--- Set the text of the label.
---@param text string The text of the label.
---@return self
function label:setText(text)end

--- Set the font size of the label, calculated by wojbie's BigFont.
---@param size BigfontFontSize The font size of the label.
---@return self
function label:setFontSize(size)end

--- Get the font size of the label.
---@return BigfontFontSize size The font size of the label.
function label:getFontSize()end

--- Set the text alignment within the label object.
---@param alignment HorizontalAlign The text alignment within the label object.
---@return self
function label:setTextAlignment(alignment)end



--------------------------------------------------------------------------------
--                                 BasaltList                                 --
--------------------------------------------------------------------------------

---@class BasaltList : BasaltObject, BasaltVisualObject, BasaltChangeableObject Allows you to create a collection of entries from which the user can make a selection.
local list = {}



-- Main methods



--- Add an entry to the list.
---@param entry string The entry to add.
---@param color Color? The background color of the entry.
---@param textColor Color? The text color of the entry.
---@param value any? The value of the entry, can be retrieved later from :onChange and :getValue.
---@return self
function list:addEntry(entry, color, textColor, value)end

--- Remove an entry from the list.
---@param entry integer The index of the entry to remove.
---@return self
function list:removeEntry(entry)end

--- Edit an entry in the list.
---@param entry integer The index of the entry to edit.
---@param text string The new text of the entry.
---@param color Color? The new background color of the entry.
---@param textColor Color? The new text color of the entry.
---@param value any? The new value of the entry.
---@return self
function list:editEntry(entry, text, color, textColor, value)end

--- Get an item by its index.
---@param index integer The index of the item to get.
---@return table item The item.
function list:getItem(index)end

--- Get the amount of items in the list.
---@return integer count The amount of items in the list.
function list:getItemCount()end

--- Set the options of a list object, all in one call.
---@param ... table|string The options to set.
---@return self
function list:setOptions(...)end

--- Returns all options as a table.
---@return table items All items as a table.
function list:getOptions()end

--- Select an item in the list as if the user clicked it.
---@param index integer The index of the item to select.
---@return self
function list:selectItem(index)end

--- Remove all items from the list.
---@return self
function list:clear()end

--- Get the item index of the currently selected item.
---@return integer index The item index of the currently selected item.
function list:getItemIndex()end

--- Set the offset of the list (scrolling).
---@param offset integer The offset of the list.
---@return self
function list:setOffset(offset)end

--- Get the offset of the list (scrolling).
---@return integer offset The offset of the list.
function list:getOffset()end

--- Makes it possible to scroll while the mouse is over the list.
---@param scrollable boolean Whether the list should be scrollable or not.
---@return self
function list:setScrollable(scrollable)end

--- Sets the background and foreground color of the item which is currently selected.
---@param bg Color The background color of the item which is currently selected.
---@param fg Color The foreground color of the item which is currently selected.
---@return self
function list:setSelectionColor(bg, fg)end

--- Sets the background and foreground color of the item which is currently selected.
---@return Color bg The background color of the item which is currently selected.
---@return Color fg The foreground color of the item which is currently selected.
function list:getSelectionColor()end

--- Checks if the selection color is active or not.
---@return boolean active Whether the selection color is active or not.
function list:isSelectionColorActive()end



-- Events



--- Register an event handler for when an entry is selected.
---@param func fun(self:self, event:string, item:string) The function to call when an entry is selected.
---@return self
function list:onSelect(func)end



--------------------------------------------------------------------------------
--                               BasaltDropdown                               --
--------------------------------------------------------------------------------

---@class BasaltDropdown : BasaltObject, BasaltVisualObject, BasaltList Dropdowns are objects where the user can click on a button, which opens a list from which the user can choose an item.
local dropdown = {}



-- Main methods



--- Set the size of the dropdown menu.
---@param width number The width of the dropdown menu.
---@param height number The height of the dropdown menu.
---@return self
function dropdown:setDropdownSize(width, height)end

--- Get the size of the dropdown menu.
---@return number width The width of the dropdown menu.
---@return number height The height of the dropdown menu.
function dropdown:getDropdownSize()end



--------------------------------------------------------------------------------
--                                BasaltMenubar                               --
--------------------------------------------------------------------------------

---@class BasaltMenubar : BasaltObject, BasaltVisualObject, BasaltList Menubars are similar to lists but are displayed horizontally instead of vertically.
local menubar = {}



-- Main methods



--- Set the amount of space between the items in the menubar.
---@param spacing number The amount of space between the items in the menubar.
---@return self
function menubar:setSpace(spacing)end

--- Get the amount of space between items in the menubar.
---@return number spacing The amount of space between items in the menubar.
function menubar:getSpace()end



--------------------------------------------------------------------------------
--                                 BasaltRadio                                --
--------------------------------------------------------------------------------

---@class BasaltRadio : BasaltObject, BasaltVisualObject, BasaltList Radios are a collection of items that you can freely place on the interface, and allow the user to select an item from the list.
local radio = {}



-- Main methods



--- Add an item to the radio.
---@param text string The text of the item.
---@param color Color? The background color of the item.
---@param textColor Color? The text color of the item.
---@param x number? The x position of the item.
---@param y number? The y position of the item.
---@param value any? The value of the item, can be retrieved later from :onChange and :getValue.
---@return self
function radio:addItem(text, color, textColor, x, y, value)end

--- Edit an item in the radio.
---@param index integer The index of the item to edit.
---@param text string The text of the item.
---@param color Color? The background color of the item.
---@param textColor Color? The text color of the item.
---@param x number? The x position of the item.
---@param y number? The y position of the item.
---@param value any? The value of the item, can be retrieved later from :onChange and :getValue.
function radio:addItem(index, text, color, textColor, x, y, value)end



--------------------------------------------------------------------------------
--                                 BasaltPane                                 --
--------------------------------------------------------------------------------

---@class BasaltPane : BasaltObject, BasaltVisualObject A Pane is used for visual background modification, without listening to any events. They have no unique method list other than the methods inherited from BasaltObject and BasaltVisualObject.
local pane = {}


--------------------------------------------------------------------------------
--                                BasaltProgram                               --
--------------------------------------------------------------------------------

---@class BasaltProgram : BasaltObject, BasaltVisualObject Program objects allow you to execute other programs within your main application.
local program = {}

---@class BasaltEventsTable
---@field event string The event to inject.
---@field args table The arguments to pass to the event.



-- Main methods



--- Get the status of the process.
---@return "running"|"normal"|"suspended"|"dead" status The status of the process.
function program:getStatus()end

--- Execute a given path or program.
---@param path string|function The path to the program, or a function to execute.
---@return self
function program:execute(path)end

--- Stops a currently running program.
---@return self
function program:stop()end

--- Suspends execution of a currently running program (pauses it).
---@param state boolean? If false, will resume the program. If true, will pause the program. If left nil, toggles the state (This may be wrong, please update if you know).
---@return self
function program:pause(state)end

--- Check if the program is paused or not.
---@return boolean paused Whether the program is paused or not.
function program:isPaused()end

--- Inject an event into the program.
---@param event string The event to inject.
---@param evenIfPaused boolean Whether to inject the event even if the program is paused.
---@param ... any The arguments to pass to the event.
---@return self
function program:injectEvent(event, evenIfPaused, ...)end

--- Inject multiple events into the program.
---@param events BasaltEventsTable The events to inject.
---@return self
function program:injectEvents(events)end

--- Get the currently queued events.
---@return table events The currently queued events.
function program:getQueuedEvents()end

--- Set the environment of the program.
---@param env table The environment of the program.
---@return self
function program:setEnvironment(env)end



-- Events



--- Register an event handler for when the program errors.
---@param func fun(self:self, error:string) The function to call when the program errors.
---@return self
function program:onError(func)end

--- Register an event handler for when the program has completed.
---@param func fun(self:self, error:string?) The function to call when the program has completed.
---@return self
function program:ondDone(func)end



--------------------------------------------------------------------------------
--                              BasaltProgressbar                             --
--------------------------------------------------------------------------------

---@class BasaltProgressbar : BasaltObject, BasaltVisualObject Progressbars are used to display the progress of a task.
local progressbar = {}

---@alias BasaltProgressBarDirection
---| `0` # Left to right
---| `1` # Top to bottom
---| `2` # Right to left
---| `3` # Bottom to top




-- Main methods



--- Set the direction in which the progressbar expands.
---@param direction BasaltProgressBarDirection
---@return self
function progressbar:setDirection(direction)end

--- Set the progress of the progress bar, as a percentage.
---@param progress number The progress of the progress bar, as a percentage (0-100).
---@return self
function progressbar:setProgress(progress)end

--- Get the progress of the progress bar, as a percentage.
---@return number progress The progress of the progress bar, as a percentage (0-100).
function progressbar:getProgress()end

--- Change the visual display of the progress bar.
---@param color Color The color of the progress bar.
---@param symbol string? The symbol used to display the progress bar (Default space)
---@param symbolColor Color? The color of the symbol used to display the progress bar.
---@return self
function progressbar:setProgressBar(color, symbol, symbolColor)end

--- Change the background symbol of the progress bar.
---@param symbol string The symbol used to display the background of the progress bar.
---@return self
function progressbar:setBackgroundSymbol(symbol)end



--------------------------------------------------------------------------------
--                               BasaltScrollbar                              --
--------------------------------------------------------------------------------

---@class BasaltScrollbar : BasaltObject, BasaltVisualObject, BasaltChangeableObject Scrollbars are used to scroll through content that is too large to fit in the available space.
local scrollbar = {}



-- Main methods



--- Set the symbol used for the scrollbar.
---@param symbol string The symbol used for the scrollbar.
---@return self
function scrollbar:setSymbol(symbol)end

--- Set the background symbol of the progressbar, default is '\127'.
---@param symbol string The background symbol of the progressbar.
---@return self
function scrollbar:setBackgroundSymbol(symbol)end

--- Set the scrollbar orientation. Default orientation is vertical.
---@param orientation "vertical"|"horizontal" The scrollbar orientation.
---@return self
function scrollbar:setBarType(orientation)end

--- Set the maximum scroll of the scrollbar.
---@param maxScroll number The maximum scroll of the scrollbar.
---@return self
function scrollbar:setScrollAmount(maxScroll)end

--- Change the scroll index of the scrollbar.
---@param scroll number The scroll index of the scrollbar.
---@return self
function scrollbar:setIndex(scroll)end

--- Get the scroll index of the scrollbar.
---@return number scroll The scroll index of the scrollbar.
function scrollbar:getIndex()end



--------------------------------------------------------------------------------
--                                 BasaltSlider                               --
--------------------------------------------------------------------------------

---@class BasaltSlider : BasaltObject, BasaltVisualObject, BasaltChangeableObject Sliders are used to select a value from a range of values.
local slider = {}



--- Set the symbol used for the slider.
---@param symbol string The symbol used for the slider.
---@return self
function slider:setSymbol(symbol)end

--- Set the background symbol of the slider, default is '\127'.
---@param symbol string The background symbol of the slider.
---@return self
function slider:setBackgroundSymbol(symbol)end

--- Set the slider orientation. Default orientation is vertical.
---@param orientation "vertical"|"horizontal" The slider orientation.
---@return self
function slider:setBarType(orientation)end

--- Set the maximum value of the slider.
---@param maxValue number The maximum value of the slider.
---@return self
function slider:setMaxValue(maxValue)end

--- Change the current index of the slider.
---@param scroll number The scroll index of the slider.
---@return self
function slider:setIndex(scroll)end

--- Get the current index of the slider.
---@return number scroll The scroll index of the slider.
function slider:getIndex()end



--------------------------------------------------------------------------------
--                               BasaltTextfield                              --
--------------------------------------------------------------------------------

---@class BasaltTextfield : BasaltObject, BasaltVisualObject, BasaltChangeableObject Textfields are used to allow the user to input text.
local textfield = {}



-- Main methods



--- Get all lines in a textfield object as a table.
---@return table<integer, string> lines All lines in a textfield object as a table.
function textfield:getLines()end

--- Get the content of a single line in a textfield object.
---@param line integer The line to get the content of.
---@return string line The content of the line.
function textfield:getLine(line)end

--- Edit the content of a line in the textfield object.
---@param line integer The line to edit.
---@param text string The new content of the line.
---@return self
function textfield:editLine(line, text)end

--- Add a line to the textfield object.
---@param text string The content of the line.
---@param line integer? The line to add the content to. If left nil, will add the line to the end of the textfield.
---@return self
function textfield:addLine(text, line)end

--- Remove a line from the textfield object.
---@param line integer The line to remove.
---@return self
function textfield:removeLine(line)end

--- Get the current text cursor position.
---@return number x The current text cursor position in the line.
---@return number y The current line the cursor is on.
function textfield:getTextCursor()end

--- Add keywords for special coloring in a textfield object.
---@param color Color The color of the keyword.
---@param keywords table<integer, string> The keywords to color.
---@return self
function textfield:addKeywords(color, keywords)end

--- Adds a new rule for special coloring in a textfield object. Like addKeywords, but uses lua patterns and also allows you to change the background color.
---@param pattern string The pattern to match.
---@param textColor Color The color of the matched text.
---@param bgColor Color The background color of the matched text.
---@return self
function textfield:addRule(pattern, textColor, bgColor)end

--- Edit an existing rule for special coloring in a textfield object.
---@param ... unknown Arguments for this function are unknown as the documentation page leads to a 404.
---@return self
function textfield:editRule(...)end

--- Remove a rule for special coloring in a textfield object.
---@param ... unknown Arguments for this function are unknown as the documentation page leads to a 404.
---@return self
function textfield:removeRule(...)end

--- Get the current offset inside the textfield
---@return unknown offset The current offset inside the textfield
function textfield:getOffset()end

--- Set the current offset inside the textfield
---@param offset unknown The current offset inside the textfield
---@return self
function textfield:setOffset(offset)end

--- Clear the textfield content.
---@return self
function textfield:clear()end

--- Set the color of selections within the textbox.
---@param ... unknown Arguments for this function are unknown as the documentation page leads to a 404.
---@return self
function textfield:setSelection(...)end

--- Get the color of selections within the textbox.
---@return unknown unknown Arguments for this function are unknown as the documentation page leads to a 404.
function textfield:getSelection()end



--------------------------------------------------------------------------------
--                                BasaltThread                                --
--------------------------------------------------------------------------------

---@class BasaltThread : BasaltObject Threads allow you to run code concurrently in the background, without blocking the main program.
local thread = {}



-- Main methods



--- Start a new thread
---@param func function The function to run in the thread.
---@return self
function thread:start(func)end

--- Stop the currently running thread.
---@return self
function thread:stop()end

--- Returns the current status of the thread object.
---@return "running"|"normal"|"suspended"|"dead" status The current status of the thread object.
function thread:getStatus()end



--------------------------------------------------------------------------------
--                               BasaltTreeview                               --
--------------------------------------------------------------------------------

---@class BasaltTreeview : BasaltObject, BasaltVisualObject A treeview object is used to display a hierarchical list of items.
local treeview = {}

---@alias BasaltAnyTreeNode
---| BasaltTreeRootNode
---| BasaltTreeNode



-- Main methods



--- Set the x and y offset values for the treeview object.
---@param x number The x offset value for the treeview object.
---@param y number The y offset value for the treeview object.
---@return self
function treeview:setOffset(x, y)end

--- Get the x and y offset values for the treeview object.
---@return number x The x offset value for the treeview object.
---@return number y The y offset value for the treeview object.
function treeview:getOffset()end

--- Set the scrollability of the treeview object.
---@param scrollable boolean Whether the treeview object should be scrollable or not.
---@return self
function treeview:setScrollable(scrollable)end

--- Sets the background and foreground colors of the selected node in the treeview object.
---@param bg Color The background color of the selected node in the treeview object.
---@param fg Color The foreground color of the selected node in the treeview object.
---@param active boolean? Whether the selection color should be active or not.
---@return self
function treeview:setSelectionColor(bg, fg, active)end

--- Gets the background and foreground colors of the selected node in the treeview object.
---@return Color bg The background color of the selected node in the treeview object.
---@return Color fg The foreground color of the selected node in the treeview object.
function treeview:getSelectionColor()end

--- Checks if the selection color is active or not.
---@return boolean active Whether the selection color is active or not.
function treeview:isSelectionColorActive()end

--- Get the root node of the treeview object.
---@return BasaltTreeRootNode root The root node of the treeview object.
function treeview:getRoot()end

--- Set a new root node for the treeview object.
---@param root BasaltTreeNode The new root node for the treeview object.
---@return self
function treeview:setRoot(root)end



-- Events



--- Register an event handler for when a node is selected.
---@param func fun(self:self, node:BasaltAnyTreeNode) The function to call when a node is selected.
---@return self
function treeview:onSelect(func)end



-- BasaltTreeRootNode

---@class BasaltTreeRootNode : BasaltObject, BasaltVisualObject A treeview node object is used to create a hierarchical list of items. The root node does not have a parent.
local treeRootNode = {}



-- Main methods



--- Get the children of the node.
---@return table<integer, BasaltTreeNode> children The children of the node.
function treeRootNode:getChildren()end

--- Add a child to the node.
---@param text string The text of the child.
---@param expandable boolean Whether the child is expandable or not.
---@return BasaltTreeNode child The child.
function treeRootNode:addChild(text, expandable)end

--- Set the expanded state of the specified node.
---@param expanded boolean Whether the node should be expanded or not.
---@return self
function treeRootNode:setExpanded(expanded)end

--- Get the expanded state of the specified node.
---@return boolean expanded Whether the node is expanded or not.
function treeRootNode:isExpanded()end

--- Remove a child from the node.
---@param child BasaltTreeNode The child to remove.
---@return self
function treeRootNode:removeChild(child)end

--- Find children by text.
---@param text string The text to search for.
---@return table<integer, BasaltTreeNode> children The children that match the text.
function treeRootNode:findChildrenByText(text)end

--- Get the text value of the node.
---@return string text The text value of the node.
function treeRootNode:getText()end

--- Set the text value of the node.
---@param text string The text value of the node.
---@return self
function treeRootNode:setText(text)end



-- BasaltTreeNode

---@class BasaltTreeNode : BasaltObject, BasaltVisualObject, BasaltTreeRootNode A treeview node object is used to create a hierarchical list of items.
local treeNode = {}



-- Main methods



--- Get the parent of the node.
---@return BasaltAnyTreeNode? parent The parent of the node.
function treeNode:getParent()end



--------------------------------------------------------------------------------
--                                 BasaltTimer                                --
--------------------------------------------------------------------------------

---@class BasaltTimer : BasaltObject Timers allow you to execute code after a specified delay.
local timer = {}



-- Main methods



--- Set the time the timer should wait before calling the function.
---@param time number The time the timer should wait before calling the function.
---@param repetitions number? The amount of times the timer should repeat. -1 is infinite.
---@return self
function timer:setTime(time, repetitions)end

--- Start the timer
---@return self
function timer:start()end

--- Cancel the timer.
---@return self
function timer:cancel()end



-- Events



--- Register an event handler for when the timer is done.
---@param func fun(self:self) The function to call when the timer is done.
---@return self
function timer:onCall(func)end

---@class BasaltTheme
---@field BaseFrameBG Color|false
---@field BaseFrameText Color|false
---@field FrameBG Color|false
---@field FrameText Color|false
---@field ButtonBG Color|false
---@field ButtonText Color|false
---@field CheckboxBG Color|false
---@field CheckboxText Color|false
---@field InputBG Color|false
---@field InputText Color|false
---@field TextfieldBG Color|false
---@field TextfieldText Color|false
---@field ListBG Color|false
---@field ListText Color|false
---@field MenubarBG Color|false
---@field MenubarText Color|false
---@field DropdownBG Color|false
---@field DropdownText Color|false
---@field RadioBG Color|false
---@field RadioText Color|false
---@field SelectionBG Color|false
---@field SelectionText Color|false
---@field GraphicBG Color|false
---@field ImageBG Color|false
---@field PaneBG Color|false
---@field ProgramBG Color|false
---@field ProgressbarBG Color|false
---@field ProgressbarText Color|false
---@field ProgressbarActiveBG Color|false
---@field ScrollbarBG Color|false
---@field ScrollbarText Color|false
---@field ScrollbarSymbolColor Color|false
---@field SliderBG Color|false
---@field SliderText Color|false
---@field SliderSymbolColor Color|false
---@field SwitchBG Color|false
---@field SwitchText Color|false
---@field LabelBG Color|false
---@field LabelText Color|false
---@field GraphBG Color|false
---@field GraphText Color|false

---@alias Color integer
