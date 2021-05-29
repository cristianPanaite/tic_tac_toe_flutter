bool isDone(List<int> elements) {
  if (elements[0] == elements[1] && elements[2] == elements[1] && elements[0] != 0) {
    return true;
  }
  if (elements[3] == elements[4] && elements[4] == elements[5] && elements[3] != 0) {
    return true;
  }
  if (elements[6] == elements[7] && elements[7] == elements[8] && elements[6] != 0) {
    return true;
  }
  if (elements[0] == elements[3] && elements[3] == elements[6] && elements[0] != 0) {
    return true;
  }
  if (elements[1] == elements[4] && elements[4] == elements[7] && elements[1] != 0) {
    return true;
  }
  if (elements[2] == elements[5] && elements[5] == elements[8] && elements[2] != 0) {
    return true;
  }
  if (elements[0] == elements[4] && elements[4] == elements[8] && elements[0] != 0) {
    return true;
  }
  if (elements[2] == elements[4] && elements[4] == elements[6] && elements[2] != 0) {
    return true;
  }
  return false;
}
