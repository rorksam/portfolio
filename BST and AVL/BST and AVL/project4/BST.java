package project4;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.Scanner;

/**
 * This class represents a Binary Search Tree, where every element is sorted
 * as it enters the tree, and each node only has 0-2 children. 
 * 
 * Written for Professor John Ortega's CSC017 Course at Hofstra University.
 * 
 * @author Sam Rork
 * @version 12/11/2023
 */
public class BST<E extends Comparable<E>> implements Iterable<E>, Cloneable {
	
	public static void main(String[] args) {
		Scanner key = new Scanner(System.in);
		System.out.println("Welcome to the BST Testing program. What would"
				+ " you like your first integer to be?");
		BST<Integer> tree = new BST<>();
		tree.add(key.nextInt());
		boolean end = false;
		String decision;
		while(!end) {
			System.out.println("Enter the method you would like to use, "
					+ "'help' to see all methods, and 'quit' to"
					+ " quit the program.");
			decision = key.nextLine();
			if(decision.equalsIgnoreCase("add")) {
				System.out.println("Type the element you want to add.");
				tree.add(key.nextInt());
			} else if (decision.equalsIgnoreCase("addAll")) {
				System.out.println("Type one element at a time, and then"
						+ " end to finalize.");
				boolean addAll = true;
				ArrayList<Integer> addAllList = new ArrayList<>();
				String newAdd;
				while (addAll) {
					newAdd = key.nextLine();
					if(newAdd.equalsIgnoreCase("end")) {
						addAll = false;
					} else {
						addAllList.add(Integer.parseInt(newAdd));
					}
					System.out.println("What next?");
				}
				tree.addAll(addAllList);
			} else if (decision.equalsIgnoreCase("ceiling")) {
				System.out.println("What number as input?");
				System.out.println(tree.ceiling(key.nextInt()));
			} else if (decision.equalsIgnoreCase("clear")) {
				tree.clear();
			} else if (decision.equalsIgnoreCase("clone")) {
				BST<Integer> cloned = tree.clone();
				System.out.println("cloned tree outputs:\n" + 
				cloned.toStringTreeFormat());
			} else if (decision.equalsIgnoreCase("contains")) {
				System.out.println("Contains which int?");
				System.out.println(tree.contains(key.nextInt()));
			} else if (decision.equalsIgnoreCase("containsAll")) {
				System.out.println("Type one element at a time, and then "
						+ "end to finalize.");
				boolean containsAll = true;
				ArrayList<Integer> containsAllList = new ArrayList<>();
				String newAdd;
				while (containsAll) {
					newAdd = key.nextLine();
					if(newAdd.equalsIgnoreCase("end")) {
						containsAll = false;
					} else {
						containsAllList.add(Integer.parseInt(newAdd));
					}
					System.out.println("What next?");
				}
				System.out.println(tree.containsAll(containsAllList));
			} else if (decision.equalsIgnoreCase("equals")) {
				System.out.println("Type one element at a time, and then "
						+ "end to finalize.");
				boolean addAll = true;
				ArrayList<Integer> addAllList = new ArrayList<>();
				String newAdd;
				while (addAll) {
					newAdd = key.nextLine();
					if(newAdd.equalsIgnoreCase("end")) {
						addAll = false;
					} else {
						addAllList.add(Integer.parseInt(newAdd));
					}
					System.out.println("What next?");
				}
				BST<Integer> equalsTester = new BST<>();
				equalsTester.addAll(addAllList);
				System.out.println(tree.equals(equalsTester));
			} else if (decision.equalsIgnoreCase("first")) {
				System.out.println(tree.first());
			} else if (decision.equalsIgnoreCase("floor")) {
				System.out.println("What number as input?");
				System.out.println(tree.floor(key.nextInt()));
			} else if (decision.equalsIgnoreCase("get")) {
				System.out.println("At what index?");
				System.out.println(tree.get(key.nextInt()));
			} else if (decision.equalsIgnoreCase("getRange")) {
				System.out.println("from...");
				int from = key.nextInt();
				System.out.println("...to...");
				System.out.println(tree.getRange(from, key.nextInt()));
			} else if (decision.equalsIgnoreCase("height")) {
				System.out.println(tree.height());
			} else if (decision.equalsIgnoreCase("higher")) {
				System.out.println("What number as input?");
				System.out.println(tree.higher(key.nextInt()));
			} else if (decision.equalsIgnoreCase("isEmpty")) {
				System.out.println(tree.isEmpty());
			} else if (decision.equalsIgnoreCase("iterator")) {
				System.out.println("Use toString to see the iteration "
						+ "through the list.");
			} else if (decision.equalsIgnoreCase("last")) {
				System.out.println(tree.last());
			} else if (decision.equalsIgnoreCase("lower")) {
				System.out.println("What number as input?");
				System.out.println(tree.lower(key.nextInt()));
			} else if (decision.equalsIgnoreCase("postOrderIterator")) {
				System.out.println("Here is post order iteration for the tree.");
				Iterator<Integer> PostO = tree.postOrderIterator();
				while(PostO.hasNext()) {
					System.out.println(PostO.next());
				}
			} else if (decision.equalsIgnoreCase("preOrderIterator")) {
				System.out.println("Here is pre-order iteration for the tree.");
				Iterator<Integer> PreO = tree.preOrderIterator();
				while(PreO.hasNext()) {
					System.out.println(PreO.next());
				}
			} else if (decision.equalsIgnoreCase("remove")) {
				System.out.println("What number as input?");
				if(tree.remove(key.nextInt())) {
					System.out.println("Successfully removed.");
				} else System.out.println("No element was removed by that call.");
			} else if (decision.equalsIgnoreCase("size")) {
				System.out.println(tree.size());
			} else if (decision.equalsIgnoreCase("toArray")) {
				System.out.println(tree.toArray());
			} else if (decision.equalsIgnoreCase("toString")) {
				System.out.println(tree);
			} else if (decision.equalsIgnoreCase("toStringTreeFormat")) {
				System.out.println(tree.toStringTreeFormat());
			} else if (decision.equalsIgnoreCase("help")) {
				System.out.println("Here are your methods:\nadd\naddAll\n"
						+ "ceiling\nclear\nclone\ncontains\ncontainsAll\nequals"
						+ "\nfirst\nfloor\nget\ngetRange\nheight\nhigher\n"
						+ "isEmpty\niterator\nlast\nlower\npostOrderIterator"
						+ "\npreOrderIterator\nremove\nsize\ntoArray\ntoString"
						+ "\ntoStringTreeFormat\nend");
			} else if (decision.equalsIgnoreCase("quit")) {
				end = true;
				System.out.println("bye");
			} 
		}
		key.close();
		
	}
	
	public Node<E> root;
	int size;
	
	/**
	 * Constructs a new, empty tree, sorted according to the 
	 * natural ordering of its elements.
	 */
	public BST() {
		root = null;
		size = 0;
	}
	/**
	 * Constructs a new tree containing the elements in the specified 
	 * collection, sorted according to the natural ordering of its elements.
	 * 
	 * @param collection - collection whose elements will comprise the new tree
	 * @throws NullPointerException - if the specified collection is null
	 */
	public BST(E[] collection) throws NullPointerException {
		try {
			if(collection == null) throw new NullPointerException();
		} catch (NullPointerException e) {
			System.err.println("BST cannot be created with "
					+ "collection defined by null.");
		}
		size = 0;
		for(E element : collection) {
			this.add(element);
			size ++;
		}
	}
	
	/**
	 * This nested class represents a post-order iterator for a BST. 
	 * 
	 * @author Sam Rork
	 * @version 12/11/2023
	 */
	private class PostOrder implements Iterator<E> {
		public Node<E> lastVisited;
		public Node<E> current;
		
		/**
		 * Default constructor for a PostOrder iterator of a BST.
		 */
		public PostOrder() {
			lastVisited = null;
			current = root;
		}
		
		@Override
		/**
		 * Returns true if the iteration has more elements. 
		 * (In other words, returns true if next() would return an element 
		 * rather than throwing an exception.)
		 * 
		 * @return true if the iteration has more elements
		 */
		public boolean hasNext() {
			return lastVisited != root;
		}

		@Override
		/**
		 * @return the next element in the iteration.
		 */
		public E next() {
			E next = null;
			if(hasNext()) { //if not at end
				do {
					if(current.left == lastVisited) { //if came up from left
						if(current.right != null) { //go right if possible
							lastVisited = current;
							current = current.right;
						} else { //otherwise just print and go up again
							next = current.data;
							lastVisited = current;
							current = current.parent;
						}
					} else if (current.right == lastVisited) { //if came up from right
						next = current.data; //go up
						lastVisited = current;
						current = current.parent;
					} else { //if didn't come from below
						if(current.left != null) { //if there is a left
							lastVisited = current; //go left
							current = current.left;
						} else if (current.right != null) { //if there is a right
							lastVisited = current; //go right
							current = current.right;
						} else { //if on leaf node
							next = current.data; //print and go up
							lastVisited = current;
							current = current.parent;
						}
					}
				} while (next == null);
			}
			return next;
		}
		
		/**
		 * Remove function from interface Iterator, not implemented here.
		 */
		public void remove() {
			throw new UnsupportedOperationException("Iterator PreOrder does "
					+ "not have a remove function.");
		}
	}
	
	/**
	 * This nested class represents a pre-order iterator for a BST.
	 * 
	 * @author Sam Rork
	 * @version 12/11/2023
	 */
	private class PreOrder implements Iterator<E> {
		public Node<E> current;
		public Node<E> lastVisited;
		public Node<E> lastNode;
		
		/**
		 * Default constructor for the PreOrder iterator. 
		 */
		public PreOrder() {
			lastVisited = null;
			current = root;
			lastNode = findLastNode(root);
		}
		
		/**
		 * Finds the final node in the PreOrder of a BST. 
		 * @param node to start on 
		 * @return last node
		 */
		public Node<E> findLastNode(Node<E> node) {
			if(node.right != null) return findLastNode(node.right);
			else if (node.left != null) return findLastNode(node.left);
			else return node;
			
		}
		
		@Override
		/**
		 * Returns true if the iteration has more elements. 
		 * (In other words, returns true if next() would return an element 
		 * rather than throwing an exception.)
		 * 
		 * @return true if the iteration has more elements
		 */
		public boolean hasNext() {
//			System.err.println("PreO hasNext visited.");
//			System.err.println("root = " + root + " lastVisited = " + lastVisited + " lastNode = " + lastNode);
			return lastVisited != lastNode;
		}

		@Override
		/**
		 * @return the next element in the iteration.
		 */
		public E next() {
//			System.err.print("PreO next() visited.");
			E next = null;
			do {
				if(hasNext()) {
					if(current.left == lastVisited) { //if we just came up from left
						if(current.right != null) { //right node is avail
							lastVisited = current; //print this and go right
							current = current.right;
						} else {
							lastVisited = current; //no right node, just go up
							current = current.parent;
						}
					} else if (current.right == lastVisited) {//came up from right
						lastVisited = current; //just go up
						current = current.parent;
					} else if (current.left != null) { //didn't come up, left avail
						next = current.data; //print and go left
						lastVisited = current;
						current = current.left;
					} else if (current.right != null) { //no left, yes right
						next = current.data; //print and go right
						lastVisited = current;
						current = current.right;
					} else { //no nodes below, didn't come from below, go up
						next = current.data;
						lastVisited = current;
						current = current.parent;
					}
				}
			} while (next == null); //only return once next is reassigned
			return next; //returns next node's value, or null if hasNext() is false
			
		}
		
		/**
		 * Remove function from interface Iterator, not implemented here.
		 */
		public void remove() {
			throw new UnsupportedOperationException("Iterator PreOrder does "
					+ "not have a remove function.");
		}
		
	}
	
	/**
	 * This nested class represents an in-order iterator for a BST. 
	 * This also happens to be the default iterator for this BST class.
	 * 
	 * @author Sam Rork
	 * @version 12/11/2023
	 */
	private class InOrder implements Iterator<E>{ //default iterator, InOrder traversal
		public Node<E> firstNode;
		public Node<E> lastVisited;
		public Node<E> current;
		public Node<E> finalNode;
		
		/**
		 * Default constructor for InOrder iterator.
		 */
		public InOrder() {
			if(root != null) {
				firstNode = findLeftmost(root);
				lastVisited = null;
				current = firstNode;
				finalNode = findRightmost(root);
			} else {
				firstNode = null;
				lastVisited = null;
				current = null;
				finalNode = null;
			}
			
		}
		
		/**
		 * Finds the rightmost node in a tree. 
		 * @param e - starting node
		 * @return rightmost node
		 */
		public Node<E> findRightmost(Node<E> e) {
			if(e.right == null) return e;
			else return findRightmost(e.right);
		}
		
		/**
		 * Finds the leftmost node in a tree.
		 * @param e - starting node
		 * @return Leftmost Node
		 */
		public Node<E> findLeftmost(Node<E> e) {
			if(e.left == null) {
				return e;
			} else {
				return findLeftmost(e.left);
			}
		}

		
		@Override
		/**
		 * Returns true if the iteration has more elements. 
		 * (In other words, returns true if next() would return an element 
		 * rather than throwing an exception.)
		 * 
		 * @return true if the iteration has more elements
		 */
		public boolean hasNext() {
			return lastVisited != finalNode;
		}

		@Override
		/**
		 * @return the next element in the iteration.
		 */
		public E next() {
			E next = null;
			do { 
				if(current.right != null) { //if we can go right, 
					if(current.right != lastVisited) { 
						//if did not just visit the right node, 
						next = current.data; 
						lastVisited = current; 
						current = findLeftmost(current.right); 
						//go right, and then go as left as possible
					} else {
						lastVisited = current;
						current = current.parent;
					}
				} else {
					next = current.data;
					lastVisited = current;
					current = current.parent;
				}	
			} while (next == null && hasNext());
			return next;
		}
		
		/**
		 * Remove function from interface Iterator, not implemented here.
		 */
		public void remove() {
			throw new UnsupportedOperationException("Iterator PreOrder does "
					+ "not have a remove function.");
		}
	}
	
	/**
	 * This nested class represents an individual unit of a BST, called a Node. 
	 * 
	 * @author Sam Rork
	 * 
	 * @version 12/11/2023
	 */
	private static class Node<E> {
		E data;
		Node<E> left;
		Node<E> right;
		Node<E> parent; //necessary for iterating upwards in iterators
		int height; //will be useful for AVL
		
		/**
		 * Default constructor for class Node<E>.
		 */
//		public Node(){
//			data = null;
//			left = null;
//			right = null;
//			parent = null;
//			height = 1;
//		}
		public String toString() {
			return String.valueOf(data);
		}
		/**
		 * Constructor for Node<E> given data input.
		 * @param e
		 */
		public Node(E e) {
			data = e;
			left = null;
			right = null;
			parent = null;
			height = 1;
		}
		/**
		 * Constructor for Node<E> given a data input and a parent node.
		 * @param E e (data field)
		 * @param Node p (parent node)
		 */
		public Node(E e, Node<E> p) {
			data = e;
			parent = p;
			left = null;
			right = null;
			height = 1;
		}
		
//		public Node(E e, Node<E> l, Node<E> r, Node<E> p, int h) {
//			data = e;
//			left = l;
//			right = r;
//			parent = p;
//			height = h;
//		}
		
		/**
		 * Updates the height of a node and its subtrees, recursively.
		 */
		public void updateHeight() {
			int leftHeight = 0;
			int rightHeight = 0;
			if(this.left != null) {
				this.left.updateHeight();
				leftHeight = this.left.height;
			}
			if(this.right != null) {
				this.right.updateHeight();
				rightHeight = this.right.height;
			}
			if(rightHeight > leftHeight) {
				this.height = rightHeight + 1;
			} else this.height = leftHeight + 1;
		}
	}
	
	/**
	 * Adds the specified element to this set if it is not already present. 
	 * More formally, adds the specified element e to this tree if the set contains 
	 * no element e2 such that Objects.equals(e, e2). If this set already contains 
	 * the element, the call leaves the set unchanged and returns false.
	 * @param e - element to be added to this set
	 * @return true if this set did not already contain the specified element
	 */
	public boolean add(E e) {
		if (root == null) {
			size ++;
			root = new Node<E>(e);
			return true;
		}
		return (recAdd(root, e) != null);
	}
	
	/**
	 * The functionality of add(E e). It does this by searching for where the element
	 * should be, and placing it there if it isn't already there. 
	 * @param n - node to start searching at
	 * @param e - element to add
	 * @return the new node, or null if the element is already in the list
	 */
	public Node<E> recAdd(Node<E> n, E e) {
		if(e.compareTo(n.data) < 0) {
			if(n.left != null) {
				recAdd(n.left, e);
			} else {
				n.left = new Node<E>(e, n);
				n.updateHeight(); 
				size ++;
				return n.left;
			}
		} else if (e.compareTo(n.data) > 0){
			if(n.right != null) {
				recAdd(n.right, e);
			} else {
				n.right = new Node<E>(e, n);
				n.updateHeight();
				size ++;
				return n.right;
			}
		} return null;
	}
	
	/**
	 * Adds all of the elements in the specified collection to this tree.
	 * This operation should be O(MH) where M is the size of the collection 
	 * and H is the height of the current tree.
	 * @param collection - collection containing elements to be added to this set
	 * @return true if this set changed as a result of the call
	 */
	public boolean addAll(Collection<? extends E> collection) {
		boolean returner = false;
		for(E e : collection) {
			if(this.add(e)) {
				returner = true;
			}
		}
		return returner;
	}
	
	/**
	 * Returns the least element in this tree greater than or equal to 
	 * the given element, or null if there is no such element.
	 * @param e - the value to match
	 * @return the least element greater than or equal to e, or null 
	 *     if there is no such element
	 * @throws ClassCastException if the specified element cannot be 
	 *     compared with the elements currently in the set
	 * @throws NullPointerException if the specified element is null
	 */
	public E ceiling(E e) throws ClassCastException, NullPointerException {
		return closeValueUp(e, true);
	}
	
	/**
	 * The functionality for both ceiling(E e) and higher(E e), since each are
	 * the same, aside from the upper-bound inclusivity. 
	 * @param e - the value to match
	 * @param inclusive - boolean for if upper bound should be inclusive or exclusive
	 * @return the least element greater than the e, greater than or equal to 
	 *     if inclusive, and null if there is no such element
	 * @throws ClassCastException
	 * @throws NullPointerException
	 */
	private E closeValueUp(E e, boolean inclusive) throws ClassCastException, 
	NullPointerException {
		try {
			for(E element : this) { //since we're using an InOrder traversal,
				if ((element.compareTo(e) > 0) || ((element.compareTo(e) == 0) 
						&& inclusive)) { //for loop goes from lowest -> highest
					return element;
				}
			}
		} catch (ClassCastException classE) {
			System.err.println("Data type " + e.getClass() + " could not be cast"
					+ " to type " + this.root.data.getClass());
		} catch (NullPointerException pointE) {
			System.err.println("Null value cannot be used as parameter "
					+ "for closeValueUp(E e).");
		}
		return null;
		
	}
	
	/**
	 * Removes all of the elements from this set. The set will be empty after 
	 * this call returns.
	 */
	public void clear() {
		size = 0;
		root = null;
	}
	
	/**
	 * Returns a shallow copy of this tree instance (i.e., the elements 
	 * themselves are not cloned but the nodes are).
	 * 
	 * @return a shallow copy of this tree
	 */
	public BST<E> clone(){
		BST<E> clone = new BST<>();
		for(E e : this) {
			clone.add(e);
		}
		return clone;
	}
	
	/**
	 * Returns true if this set contains the specified element. 
	 *     More formally, returns true if and only if this set contains 
	 *     an element e such that Objects.equals(o, e).
	 * @param o - object to be checked for containment in this set
	 * @return true if this set contains the specified element
	 * @throws ClassCastException if the specified object cannot be compared with
	 *     the elements currently in the set
	 * @throws NullPointerException if the specified element is null and this set 
	 *     uses natural ordering, or its comparator does not permit null elements
	 */
	public boolean contains(Object o) throws ClassCastException, NullPointerException{
		try {
			for(E e : this) {
				if(e.equals(o)) {
					return true;
				}
			} return false;
		} catch (ClassCastException exc) {
			System.err.println("ClassCastException in contains(Object o): " + exc);
			return false;
		} catch (NullPointerException exc) {
			System.err.println("NullPointerException in contains(Object o): " + exc);
			return false;
		}
		
	}
	
	
	/**
	 * Returns true if this collection contains all of the elements in the specified 
	 *     collection. This implementation iterates over the specified collection, 
	 *     checking each element returned by the iterator in turn to see if it's 
	 *     contained in this tree. If all elements are so contained true is returned, 
	 *     otherwise false.
	 * @param c - collection to be checked for containment in this tree
	 * @return true if this tree contains all of the elements in the specified collection
	 * @throws NullPointerException if the specified collection contains one or 
	 *     more null elements and this collection does not permit null elements, 
	 *     or if the specified collection is null.
	 */
	public boolean containsAll(Collection<?> c) throws NullPointerException{
		boolean r = true;
		try {
			for (Object item : c) {
				if(!this.contains(item)) {
					r = false;
				}
			}
		} catch (NullPointerException e) {
			System.err.println("Collection given to containsAll contains one "
					+ "or more null elements.");
			return false;
		}
		return r;
	}
	
	
	/**
	 * Compares the specified object with this tree for equality. Returns 
	 *     true if the given object is also a tree, the two trees have the same size, 
	 *     and every member of the given tree is contained in this tree.
	 * @Overrides equals in class Object
	 * @param obj - object to be compared for equality with this tree
	 * @return true if the specified object is equal to this tree
	 */
	@SuppressWarnings("unchecked") //since we check for class equivalence first,
	                               //warning is unnecessary
	@Override
	public boolean equals(Object obj) { 
		if(obj.getClass() == this.getClass()) {
			if(((BST<E>)obj).size() == this.size()) {
				for(E e : this) {
					if(!((BST<E>)obj).contains(e)) {
						return false;
					}
				} return true;
			}
		}
		return false;
	}
	
	/**
	 * Returns the first (lowest) element currently in this tree.
	 * @return the first (lowest) element currently in this tree.
	 * @throws NoSuchElementException if this set is empty.
	 */
	public E first() throws NoSuchElementException {
		for(E e : this) return e; //inorder iterator! first value is lowest value
		return null;
	}
	
	/**
	 * Returns the greatest element in this set less than or equal 
	 *     to the given element, or null if there is no such element.
	 * @param e - the value to match
	 * @return the greatest element less than or equal to e, or null 
	 *     if there is no such element.
	 * @throws ClassCastException if the specified element cannot be 
	 *     compared with the elements currently in the set
	 * @throws NullPointerException if the specified set is null
	 */
	public E floor(E e) throws ClassCastException, NullPointerException{
		return closeValueDown(e, true);
	}
	
	/**
	 * The functionality for floor and lower, since both are the same aside from 
	 *     inclusivity of the top bound.
	 * @param e - the value to match
	 * @param inclusive - true if upper bound equality is allowed
	 * @return the greatest element less than (or equal, if allowed) to e, or null
	 *     if there is no such element.
	 * @throws ClassCastException if the specified element cannot be 
	 *     compared with the elements currently in the set
	 * @throws NullPointerException if the specified set is null
	 */
	private E closeValueDown(E e, boolean inclusive) throws ClassCastException, 
	NullPointerException {
		E prev = null;
		try {
			for(E element : this) {
				if((element.compareTo(e) > 0) || (!inclusive && 
						(element.compareTo(e) >= 0))) { //greater than, gone too far
					return prev; //return the last (null if we're on element 0)
				} else prev = element; //otherwise, this is new previous
			}
		} catch (ClassCastException classE) {
			System.err.println("Data type " + e.getClass() + " could not be cast to "
					+ "type " + this.root.data.getClass());
		} catch (NullPointerException pointE) {
			System.err.println("Null value cannot be used as parameter for "
					+ "closeValueDown(E e, boolean inclusive).");
		}
		return null;
		
	}
	
	/**
	 * Returns the element at the specified position in this tree. 
	 *     The order of the indexed elements is the same as provided 
	 *     by this tree's iterator. The indexing is zero based 
	 *     (i.e., the smallest element in this tree is at index 0 
	 *     and the largest one is at index size()-1).
	 * @param index - index of the element to return
	 * @return the element at the specified position in this tree
	 * @throws IndexOutOfBoundsException if the index is out of range 
	 *     (index < 0 || index >= size())
	 */
	public E get(int index)throws IndexOutOfBoundsException {
		try {
			int i = 0;
			for(E e : this) {
				if (i == index) return e;
				else i ++;
			}
		} catch (IndexOutOfBoundsException exc) {
			System.err.println("IndexOutOfBoundsException found in get(int index): "
					+ exc);
		}
		return null;
	}
	
	/**
	 * Returns a collection whose elements range from fromElement, 
	 *     inclusive, to toElement, inclusive. The returned collection/list 
	 *     is backed by this tree, so changes in the returned list are reflected 
	 *     in this tree, and vice-versa (i.e., the two structures share elements. 
	 *     The returned collection should be organized according to the natural 
	 *     ordering of the elements (i.e., it should be sorted).
	 * @param fromElement - low endpoint (inclusive) of the returned collection
	 * @param toElement - high endpoint (inclusive) of the returned collection
	 * @return a collection containing a portion of this tree whose elements 
	 *     range from fromElement, inclusive to toElement, inclusive
	 * @throws NullPointerException if fromElement or toElement is null
	 * @throws IllegalArgumentException if fromElement is greter than toElement
	 */
	public ArrayList<E> getRange(E fromElement, E toElement)throws 
	NullPointerException, IllegalArgumentException {
		
		try {
			if(fromElement == null || toElement == null) {
				throw new NullPointerException();
			} else if (toElement.compareTo(fromElement) < 0) {
				throw new IllegalArgumentException();
			}
		} catch (NullPointerException exc) {
			System.err.println("NullPointerException found in getRange(): "
					+ "fromElement and toElement cannot be null.");
			return null;
		} catch (IllegalArgumentException exc) {
			System.err.println("IllegalArgumentException found in getRange(): "
					+ "fromElement cannot be greater than toElement.");
			return null;
		}
		boolean counting = false;
		ArrayList<E> collection = new ArrayList<>();
		for(E e: this) {
			if(e.compareTo(fromElement) >= 0) {
				counting = true;
			}
			if(e.compareTo(toElement) > 0) {
				counting = false;
			}
			
			if(counting) collection.add(e);
		}
		return collection;
	}
	
	
	/**
	 * Returns the height of this tree. The height of a leaf is 1. The height 
	 *     of the tree is the height of its root node.
	 * @return the height of this tree or zero if the tree is empty
	 */
	public int height() {
		if (root == null) return 0;
		else {
			root.updateHeight();
			return root.height;
		}
	}
	
	
	/**
	 * Returns the least element in this tree strictly greater 
	 *     than the given element, or null if there is no such element.
	 * @param e - the value to match
	 * @return the least element greater than e, or null if there is no such element
	 * @throws ClassCastException - if the specified element cannot be 
	 *     compared with the elements currently in the set
	 * @throws NullPointerException - if the specified element is null
	 */
	public E higher(E e) throws ClassCastException, NullPointerException{
		return closeValueUp(e, false);
	}
	
	/**
	 * Returns true if this set contains no elements.
	 * @return true if this set contains no elements.
	 */
	public boolean isEmpty() {
		return size == 0;
	}
	
	/**
	 * Returns an iterator over the elements in this tree in ascending order.
	 * @return an iterator over the elements in this tree in ascending order
	 */
	@Override
	public Iterator<E> iterator() {
		return new InOrder();
	}
	
	/**
	 * Returns the last (highest) element currently in this tree.
	 * @return the last (highest) element currently in this tree
	 * @throws NoSuchElementException if this set is empty 
	 */
	public E last() throws NoSuchElementException {
		try {
			if(root == null) throw new NoSuchElementException();
		} catch (NoSuchElementException exc) {
			System.err.println("Cannot access, list is empty.");
		}
		Node<E> curr = root;
		while(curr.right != null) {
			curr = curr.right;
		}
		return curr.data;
	}
	
	/**
	 * Returns the greatest element in this set strictly less than the 
	 *     given element, or null if there is no such element.
	 * @param e - the value to match
	 * @return the greatest element less than e, or null if there is no such element
	 * @throws ClassCastException - if the specified element cannot be compared with 
	 *     the elements currently in the set
	 * @throws NullPointerException - if the specified element is null
	 */
	public E lower(E e) throws ClassCastException, NullPointerException {
		return closeValueDown(e, false);
	}
	
	/**
	 * Returns an iterator over the elements in this tree in order of the 
	 *     postorder traversal.
	 * @return an iterator over the elements in this tree in order of the 
	 *     postorder traversal
	 */
	public Iterator<E> postOrderIterator() {
		return new PostOrder();
	}
	
	/**
	 * Returns an iterator over the elements in this tree in order of the 
	 *     preorder traversal
	 * @return an iterator over the elements in this tree in order of the 
	 *     postorder traversal
	 */
	public Iterator<E> preOrderIterator() {
		return new PreOrder();
	}
	
	/**
	 * Most of the functionality for remove(Object o), recursively compares o 
	 *     to each node in the BST to find where the desired node with data 
	 *     value equal to o resides.
	 * @param o - the value to match
	 * @param node - node to start searching at (root if first call)
	 * @return the node with data field equal to o, or null if no such node 
	 *     exists.
	 * @throws ClassCastException if Object o cannot be casted on generic type 
	 *     E (Node data field)
	 */
	@SuppressWarnings("unchecked") //throwing ClassCastException for this reason
	public Node<E> getNode(Object o, Node<E> node) throws ClassCastException {
		try {
			//Node<E> target = root;
			Node<E> target = node;
			if(target.data.compareTo((E) o) > 0) {
				return getNode(o, node.left);
			} else if (target.data.compareTo((E) o) < 0) {
				return getNode(o, node.right);
			} else return node;
		} catch (ClassCastException exc) {
			System.err.println("Error: class type " + o.getClass() + 
					" cannot be compared with type " + node.data.getClass() + 
					" of the BST.");
			return null;
		}
	}
	
	/**
	 * Finds the rightmost node in the left subtree of node n. This is useful 
	 *     for the remove function.
	 * @param n - initial node
	 * @return the rightmost node in the left subtree of node n
	 */
	public Node<E> predecessor(Node<E> n){ 
		if(n.left == null) {
			return null;
		} else {
			n = n.left;
			while(n.right != null) {
				n = n.right;
			}
			return n;
		}
	}
	
	/**
	 * Removes the specified element from this tree if it is present. More 
	 *     formally, removes an element e such that Objects.equals(o, e), 
	 *     if this tree contains such an element. Returns true if this tree 
	 *     contained the element (or equivalently, if this tree changed as a 
	 *     result of the call). (This tree will not contain the element once 
	 *     the call returns.)
	 * @param o - object to be removed from the set, if present
	 * @return true if this tree contained the element (or equivalently, if 
	 *     this tree changed as a result of the call). 
	 * @throws ClassCastException - if the specified object cannot be compared
	 *     with the elements currently in this tree
	 * @throws NullPointerException - if the specified element is null
	 */
	public boolean remove(Object o) throws ClassCastException, NullPointerException{
		try {
			if(o == null) throw new NullPointerException();
			Node<E> target = getNode(o, root);
			if(target == null) return false;
			Node<E> pred = predecessor(target);
			if(pred == null) {
				if(target.parent.right == target) {
					if(target.right != null) {
						target.parent.right = target.right;
					} else target.parent.right = null;
					size --;
					return true;
				} else {
					if(target.right != null) {
						target.parent.left = target.right;
					} else target.parent.left = null;
					size --;
					return true;
				}
			}
			else target.data = pred.data;
			if(pred.parent.right == pred) {
				pred.parent.right = pred.left;
			} else {
				pred.parent.left = pred.left;
			}
			size --;
			return true;
		} catch (ClassCastException exc) {
			return false;
		} catch (NullPointerException exc) {
			System.err.println("Cannot search for query 'null' in BST.");
			return false;
		}
	}
	
	/**
	 * Returns the number of elements in this tree.
	 * @return the number of elements in this tree
	 */
	public int size() {
		return size;
	}
	
	/**
	 * This function returns an array containing all the elements returned by 
	 *     this tree's iterator, in the same order, stored in consecutive 
	 *     elements of the array, starting with index 0. The length of the 
	 *     returned array is equal to the number of elements returned by the 
	 *     iterator.
	 * @return an array, whose runtime component type is Object, containing 
	 *     all of the elements in this tree
	 */
	public Object[] toArray() {
		Object[] arraying = new Object[this.size()];
		Iterator<E> iter = this.iterator();
		for(int i = 0; i < this.size(); i ++) {
			arraying[i] = iter.next();
		}
		return arraying;
	}
	
	/**
	 * Returns a string representation of this tree. The string representation
	 *     consists of a list of the tree's elements in the order they are 
	 *     returned by its iterator (inorder traversal), enclosed in square 
	 *     brackets ("[]"). Adjacent elements are separated by the characters 
	 *     ", " (comma and space). Elements are converted to strings as by 
	 *     String.valueOf(Object).
	 * @return a string representation of this collection
	 */
	public String toString() {
		StringBuilder result = new StringBuilder();
		result.append("[");
		//String result = "[";
		for(E e : this) {
			result.append(String.valueOf(e));
			result.append(", ");
		}
		if(result.length() > 2) result.delete(result.length()-2, result.length());
		result.append("]");
		return result.toString();
	}
	
	/**
	 * The recursive functionality for toStringTreeFormat. 
	 * @param n - current node
	 * @param levels - what depth the node is at
	 * @param s - current version of the String to return
	 * @return string containing tree-like representation of this tree.
	 */
	public String recStringTreeFormat(Node<E> n, int levels, String s) {
		String addition = "\n";
		String tabs = "   ";
		String indent = "|--";
		for(int i = 0; i < levels - 1; i ++) {
			addition += tabs;
		}
		if(levels > 0) addition += indent;
		if(n != null) {
			s += addition + n.data + recStringTreeFormat(n.left, levels + 1, s) + 
				recStringTreeFormat(n.right, levels + 1, s);
			return s;
		} else {
			s += addition + "null";
			return s;
		}
		
		
	}
	
	/**
	 * Produces tree like string representation of this tree. Returns a 
	 *     string representation of this tree in a tree-like format. The 
	 *     string representation consists of a tree-like representation of 
	 *     this tree. Each node is shown in its own line with the indentation 
	 *     showing the depth of the node in this tree. The root is printed on 
	 *     the first line, followed by its left subtree, followed by its right 
	 *     subtree
	 * @return string containing tree-like representation of this tree.
	 */
	public String toStringTreeFormat() {
		return recStringTreeFormat(root, 0, "");
	}

}
